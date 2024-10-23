class AppConst {
  static bool showBalance = false;

  static const String appName = 'المحاضر';
  static bool isFirstTimeCheck = true;
  static const String countryCode = 'SA';
  static const String domain = 'almohagerlms.com';
  static const String webUrl = 'https://$domain/';
  static const String coursesUrl = '${webUrl}classes';
  static const String myCoursesUrl = '${webUrl}panel/webinars/purchases';
  static const String examsUrl = '${webUrl}panel/quizzes/opens';
  static const String walletUrl = '${webUrl}panel/financial/account';
  static const String myAccountUrl = '${webUrl}panel/setting';
  static const String instructorsUrl = '${webUrl}instructors';
  static const String examsResultsUrl = '${webUrl}panel/quizzes/my-results';
  static const String aboutUs = '${webUrl}aboutlms';
  static const String help = '${webUrl}panel/support';
  static const String notifications = '${webUrl}panel/notifications';

  // BOXES NAMES
  static const mainBoxName = 'mainBox';
  static const String isFirstTime = 'isFirstTime';

  // BOXES KEYS
  static const userIdBox = 'userId';
  static const isDarkBox = 'isDarkBox';
  static const introFinishBox = 'introFinish';
  static const tokenBox = 'token';
  static const isLoggedInBox = 'isLoggedIn';

  static const listOfSocials = [
    'facebook',
    'instagram',
    'twitter',
    'linkedIn',
    'whatsapp',
    'snapchat',
    'telegram',
    'tg',
    't.me',
    'youtube',
    'tiktok',
    'pinterest',
    'tumblr',
    'reddit',
    'flickr',
    'vimeo',
    'soundcloud',
    'spotify',
    'github',
    'behance',
    'dribbble',
    'medium',
    'quora',
    'vk',
    'wechat',
    'mail',
    'mailto',
    'tel',
    'phone',
    'call',
    'sms',
    'maps',
    'waze',
    'messenger',
    'skype',
    'zoom',
    'meet',
    'meet.google',
    'intent',
    'fb-messenger',
    'osamashmala.com',
  ];

  /// Extensions
  static const List<String> allExtensions = [
    'pdf',
    'doc',
    'docx',
    'xls',
    'xlsx',
    'ppt',
    'pptx',
    'txt',
    'jpg',
    'jpeg',
    'png',
    'gif',
    'mp3',
    'mp4',
    'avi',
    'mkv',
    'zip',
    'rar',
    '7z',
  ];
}
