// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'E-Clinic';

  @override
  String get emptyUserNameHint => 'الرجاء إدخال اسم المستخدم';

  @override
  String get password => 'كلمة المرور';

  @override
  String get generalPractitioner => 'طبيب عام';

  @override
  String get rating => 'التقييم';

  @override
  String get votes => 'عدد الأصوات';

  @override
  String welcomeUser(Object name) {
    return 'مرحباً $name!';
  }

  @override
  String get welcomeUserDenis => 'مرحباً دينيس هـ!';

  @override
  String get welcomeSubtitle => 'لوريم إيبسوم دولار سيت أميت،';

  @override
  String get searchForCategories => 'البحث عن التصنيفات';

  @override
  String get doctors => 'الأطباء';

  @override
  String get hospital => 'مستشفى';

  @override
  String get hospitals => 'المستشفيات';

  @override
  String get listOfHospitals => 'قائمة المستشفيات';

  @override
  String get specialities => 'التخصصات';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get changeLanguage => 'تغيير اللغة';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get contactUs => 'تواصل معنا';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get categories => 'المجموعات';

  @override
  String get allServices => 'جميع الخدمات';

  @override
  String get error => 'خطأ';

  @override
  String get now => 'الان';

  @override
  String get badRequest => 'طلب إتصال غير صالح';

  @override
  String get unauthorized => 'غير مصرح';

  @override
  String get forbidden => 'ممنوع';

  @override
  String get notFound => 'لم يتم العثور ';

  @override
  String get notFoundServer => 'لم يتم العثور على السيرفر';

  @override
  String get internalServerError => 'حدث خطأ داخلي في السيرفر';

  @override
  String get badGateway => 'بوابة اتصال غير صالحة';

  @override
  String get formValidateError => 'الرجاء التأكد من تعبئة كافة الحقول';

  @override
  String get cancelRequest => 'تم إلغاء التواصل مع السيرفر';

  @override
  String get connectionTimeOut => 'انتهت مهلة الاتصال بالسيرفر';

  @override
  String get receiveTimeOut => 'انتهت المهلة لتلقي الخدمة من السيرفر';

  @override
  String get sendTimeOut => 'انتهت المهلة لارسال الخدمة للسيرفر';

  @override
  String get socketException => 'تحقق من اتصالك بالإنترنت';

  @override
  String get unknownError => 'هناك خطأ ما!';

  @override
  String get duplicateEmail => 'البريد الإلكتروني مستعمل من قبل';

  @override
  String get selectImageError => 'لم تقم بإختيار اي صورة!';

  @override
  String get success => 'نجاح';

  @override
  String get message => 'رسالة';

  @override
  String get status => 'الحالة';

  @override
  String get minute => 'دقيقة';

  @override
  String get hours => 'ساعات';

  @override
  String get hour => 'ساعة';

  @override
  String get day => 'يوم';

  @override
  String get days => 'الأيام';

  @override
  String get year => 'سنة';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get emptyMobileHint => 'أدخل رقم الهاتف الخاص بك';

  @override
  String get notValidMobileHint => 'رقم هاتف غير صحيح';

  @override
  String get emptyEmailHint => 'أدخل البريد الإلكتروني الخاص بك';

  @override
  String get notValidEmailHint => 'بريد إلكتروني غير صحيح';

  @override
  String get emptyPasswordHint => 'أدخل الرقم السري';

  @override
  String passwordValidateLengthHint(Object count) {
    return 'يجب ان يكون الرقم السري على الاقل $count خانات';
  }

  @override
  String minValidateHint(Object count) {
    return 'يجب ان يكون هذا الحقل على الاقل $count خانات';
  }

  @override
  String maxValidateHint(Object count) {
    return 'يجب ان يكون هذا الحقل على الأكثر $count خانات';
  }

  @override
  String get emptyFieldHint => 'لا يمكن ترك هذا الحقل فارغ !';

  @override
  String get notValidNumberHint => 'صيغة الحقل غير صالحة كرقم';

  @override
  String get loading => 'جار التحميل...';

  @override
  String get checkInternet => 'الرجاء التحقق من اتصال الانترنت لديك';

  @override
  String addSuccess(Object name) {
    return 'تم إضافة $name بنجاح';
  }

  @override
  String editSuccess(Object name) {
    return 'تم تعديل $name بنجاح';
  }

  @override
  String deleteSuccess(Object name) {
    return 'تم حذف $name بنجاح';
  }

  @override
  String addFailed(Object name) {
    return '$name حصل خطأ اثناء إضافة ';
  }

  @override
  String editFailed(Object name) {
    return '$name حصل خطأ اثناء تعديل ';
  }

  @override
  String deleteFailed(Object name) {
    return '$name حصل خطأ اثناء حذف ';
  }

  @override
  String get settings => 'الاعدادات';

  @override
  String get noDataFound => '!لا يوجد بيانات لعرضها';

  @override
  String modelNotFound(Object name) {
    return 'لم يتم العثور على $name ';
  }

  @override
  String get user => 'مستخدم';

  @override
  String get users => 'المستخدمين';

  @override
  String get network => 'الشبكة';

  @override
  String get userName => 'إسم المستخدم';

  @override
  String get server => 'السيرفر';

  @override
  String get internetConnection => 'الاتصال بالانترنت';

  @override
  String get version => 'النسخة';

  @override
  String get loadingInitData => ' جار تهيئة إعدادات النظام';

  @override
  String get noInternetConnection => 'لا يوجد إتصال بالانترنت ';

  @override
  String get cantProceed => 'لا يمكن المتابعة';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get active => 'فعال';

  @override
  String get inActive => 'غير فعال';

  @override
  String get subscribe => 'الإشتراك';

  @override
  String get expireIn => 'ينتهي في';

  @override
  String get or => 'أو';

  @override
  String get name => 'الاسم';

  @override
  String save(Object name) {
    return 'حفظ $name';
  }

  @override
  String get language => 'اللغة';

  @override
  String get phoneNumber => 'رقم الجوال';

  @override
  String get otp => 'رمز ال OTP';

  @override
  String get zipCode => 'الرمز البريدي';

  @override
  String get city => 'المدينة';

  @override
  String get countryName => 'اسم الدولة';

  @override
  String get category => 'المجموعة';

  @override
  String get quantity => 'الكمية';

  @override
  String get price => 'السعر';

  @override
  String get total => 'الاجمالي';

  @override
  String get back => 'رجوع';

  @override
  String get backToHome => 'العودة الى الرئيسية';

  @override
  String get exitHint => 'إضغط مرة أخرى للخروج';

  @override
  String edit(Object name) {
    return 'تعديل $name';
  }

  @override
  String add(Object name) {
    return 'إضافة $name';
  }

  @override
  String delete(Object name) {
    return 'حذف $name';
  }

  @override
  String get currency => 'ر.س';

  @override
  String get requiredField => 'حقل إجباري';

  @override
  String get search => 'بحث';

  @override
  String get print => 'طباعة';

  @override
  String get ar => 'العربية';

  @override
  String get en => 'English';

  @override
  String get register => 'تسجيل الحساب';

  @override
  String get enterEmailHint => 'الرجاء إدخال البريد الالكتروني للمتابعة';

  @override
  String get enterPasswordHint => 'الرجاء إدخال الرقم السري';

  @override
  String get dontHaveAccount => 'لا تملك حساب؟ ';

  @override
  String get goToRegister => 'اذهب لإنشاء حسابك ';

  @override
  String get userNameHint => 'الرجاء إدخال اسم المستخدم';

  @override
  String get loginFailed => 'فشل تسجيل الدخول، يرجى المحاولة مرة أخرى.';

  @override
  String get userExists => 'المستخدم موجود بالفعل';

  @override
  String get registerFailed => 'فشل التسجيل، يرجى المحاولة مرة أخرى لاحقًا';

  @override
  String get registerSuccess => 'تم إنشاء الحساب بنجاح';

  @override
  String get loginSuccess => 'تم تسجيل الدخول بنجاح';

  @override
  String get goToPay => 'الذهاب للدفع';

  @override
  String get free => 'مجانا';

  @override
  String count(Object count) {
    return 'عدد $count';
  }

  @override
  String get duration => 'المدة';

  @override
  String get month => 'شهر';

  @override
  String get product => 'منتج';

  @override
  String get unlimited => 'غير محدود';

  @override
  String get pay => 'الدفع';

  @override
  String details(Object name) {
    return 'تفاصيل $name';
  }

  @override
  String get successPayment => 'تمت عملية الدفع بنجاح ';

  @override
  String get failedPayment => 'فشل في معالجة عملية الدفع';

  @override
  String get image => 'صورة';

  @override
  String get allCategories => 'كل المجموعات';

  @override
  String get specificCategories => 'مجموعة معينة';

  @override
  String get doYouHaveAccount => 'هل تمتلك حساب لدينا؟';

  @override
  String get ourClients => 'عملاؤنا';

  @override
  String get advertisements => 'إعلانات';

  @override
  String get faq => 'الأسئلة الشائعة';

  @override
  String get showAll => 'عرض الكل';

  @override
  String get showLess => 'عرض أقل';

  @override
  String get title => 'العنوان';

  @override
  String get send => 'إرسال';

  @override
  String get joinUs => 'انضم إلينا';

  @override
  String hello(Object name) {
    return 'أهلا $name';
  }

  @override
  String get notifications => 'الاشعارات';

  @override
  String get tryAgain => 'المحاولة مرة اخرى';

  @override
  String get yearly => 'سنوي';

  @override
  String get daily => 'يومي';

  @override
  String get confirm => 'تأكيد';

  @override
  String get apply => 'تطبيق';

  @override
  String get nameAr => 'الإسم بالعربي';

  @override
  String get nameEn => 'الإسم بالانجليزي';

  @override
  String get warning => 'تنبيه';

  @override
  String get youAreOffline => 'أنت غير متصل بالانترنت';

  @override
  String get noInternet => 'لا يوجد إتصال';

  @override
  String get internetConnectionRestored => 'تم إستعادة الاتصال بالانترنت';

  @override
  String get connected => 'تم الإتصال';
}
