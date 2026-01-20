import '../../../../global_imports.dart';
import '../../../../core/services/api.service.dart';
import '../../../../core/services/user_storage_service.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widget/app_widget/custom_gradient_app_bar.dart';

class BookingFormScreen extends StatefulWidget {
  final int hospitalId;
  final int doctorId;
  final String doctorName;

  const BookingFormScreen({
    super.key,
    required this.hospitalId,
    required this.doctorId,
    required this.doctorName,
  });

  @override
  State<BookingFormScreen> createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  final ApiServices _apiServices = getIt<ApiServices>();
  final _formKey = GlobalKey<FormState>();
  final _commentsController = TextEditingController();
  
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  bool _isLoading = false;
  String? _error;

  @override
  void dispose() {
    _commentsController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? const TimeOfDay(hour: 9, minute: 0),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  String _formatTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _submitBooking() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedDate == null || _selectedTime == null) {
      setState(() {
        _error = 'Please select both date and time';
      });
      return;
    }

    // Get patient ID from stored user data
    final patientId = UserStorageService.instance.getUserId();
    if (patientId == null) {
      setState(() {
        _error = 'User not logged in. Please login first.';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await _apiServices.postData(
        '/api/v1/appointmentBooking',
        {
          'patient': 'self',
          'hospital': widget.hospitalId,
          'doctor_id': widget.doctorId,
          'patient_id': patientId, // Use actual patient ID from stored user data
          'time': _formatTime(_selectedTime!),
          'date': _formatDate(_selectedDate!),
          'comments': _commentsController.text.trim(),
        },
      );

      if (response['type'] == 'success') {
        _showSuccessDialog(response['appointment_id']);
      } else {
        setState(() {
          _error = 'Booking failed. Please try again.';
        });
      }
    } on DioException catch (e) {
      setState(() {
        _error = 'Network error: ${e.message}';
      });
    } catch (e) {
      setState(() {
        _error = 'An error occurred: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSuccessDialog(int appointmentId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Booking Successful', style: TextStyle(decoration: TextDecoration.none)),
        content: Text('Your appointment has been booked successfully!\nAppointment ID: $appointmentId', style: const TextStyle(decoration: TextDecoration.none)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(); // Go back to hospital team
              Navigator.of(context).pop(); // Go back to hospital list
            },
            child: const Text('OK', style: TextStyle(decoration: TextDecoration.none)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColor.tealColor, AppColor.blueColor],
        ),
      ),
      child: Column(
        children: [
          CustomGradientAppBar(
            title: 'Book Appointment',
            showBackButton: true,
          ),
          Expanded(
            child: Material(
              color: const Color(0xFFF2F7FA),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF2F7FA),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Doctor Info
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primaryColor.withOpacity(0.1),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: AppColor.primaryColor,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.doctorName,
                                style: AppTextStyle.style16B.copyWith(
                                  color: AppColor.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Doctor ID: ${widget.doctorId}',
                                style: AppTextStyle.style12.copyWith(
                                  color: AppColor.grey,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Date Picker
                  Text(
                    'Select Date',
                    style: AppTextStyle.style16B.copyWith(
                      color: AppColor.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: _selectDate,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _selectedDate == null ? AppColor.grey : AppColor.primaryColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: AppColor.primaryColor,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            _selectedDate != null
                                ? _formatDate(_selectedDate!)
                                : 'Select Date',
                            style: AppTextStyle.style14.copyWith(
                              color: _selectedDate != null ? AppColor.black : AppColor.grey,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: AppColor.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Time Picker
                  Text(
                    'Select Time',
                    style: AppTextStyle.style16B.copyWith(
                      color: AppColor.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: _selectTime,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _selectedTime == null ? AppColor.grey : AppColor.primaryColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: AppColor.primaryColor,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            _selectedTime != null
                                ? _formatTime(_selectedTime!)
                                : 'Select Time',
                            style: AppTextStyle.style14.copyWith(
                              color: _selectedTime != null ? AppColor.black : AppColor.grey,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: AppColor.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Comments
                  Text(
                    'Comments (Optional)',
                    style: AppTextStyle.style16B.copyWith(
                      color: AppColor.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _commentsController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Add any additional comments...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColor.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColor.primaryColor),
                      ),
                      filled: true,
                      fillColor: AppColor.white,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Error Message
                  if (_error != null) ...[
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColor.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: AppColor.red,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _error!,
                              style: AppTextStyle.style12.copyWith(
                                color: AppColor.red,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],

                  // Submit Button
                  _isLoading
                      ? Container(
                          width: double.infinity,
                          height: 56,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: AppColor.white,
                              strokeWidth: 2,
                            ),
                          ),
                        )
                      : Center(
                        child: AppButton.text(
                          text: 'Book Appointment',
                          height: 56,
                          onPressed: _submitBooking,
                          color: AppColor.primaryColor,
                          fontColor: AppColor.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                ],
              ),
            ),
                  ),
                ),
              ),
            ),
          ],
        ),
     
    );
  }
}
