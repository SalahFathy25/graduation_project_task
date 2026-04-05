import '../../l10n/app_localizations.dart';

class AppConstants {
  static List<Map<String, dynamic>> getCities(AppLocalizations l10n, bool isArabic) {
    return [
      {
        'id': 'riyadh',
        'name': isArabic ? l10n.cityRiyadh : 'Riyadh',
        'image': 'https://i.pinimg.com/736x/87/d0/19/87d0197cf80132e528551adeccf5ccd3.jpg',
        'desc': isArabic ? l10n.riyadhDesc : 'The capital and financial hub.',
        'location': isArabic ? 'وسط المملكة العربية السعودية' : 'Central Saudi Arabia',
        'region': 'central',
        'rating': 4.8,
        'weather': '32°C',
        'weatherDesc': isArabic ? 'مشمس' : 'Sunny',
        'categories': ['business', 'luxury'],
      },
      {
        'id': 'jeddah',
        'name': isArabic ? l10n.cityJeddah : 'Jeddah',
        'image': 'https://i.pinimg.com/1200x/85/cb/65/85cb65a75d0980ae3373cf1b3262adbc.jpg',
        'desc': isArabic ? l10n.jeddahDesc : 'The Bride of the Red Sea.',
        'location': isArabic ? 'غرب المملكة العربية السعودية' : 'Western Saudi Arabia',
        'region': 'western',
        'rating': 4.7,
        'weather': '30°C',
        'weatherDesc': isArabic ? 'رطب' : 'Humid',
        'categories': ['luxury', 'family'],
      },
      {
        'id': 'mecca',
        'name': isArabic ? l10n.cityMecca : 'Mecca',
        'image': 'https://imgs.search.brave.com/PnK0zW92qAFCLJM77Xi8cfkUQvjTKraHSk1GgSRY-0c/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbmcu/cG5ndHJlZS5jb20v/dGh1bWJfYmFjay9m/aDI2MC9iYWNrZ3Jv/dW5kLzIwMjUwNzAz/L3BuZ3RyZWUtYWVy/aWFsLXZpZXctb2Yt/dGhlLWthYWJhLWlu/LW1lY2NhLWlsbHVt/aW5hdGVkLWF0LW5p/Z2h0LXN1cnJvdW5k/ZWQtaW1hZ2VfMTc0/NTY4NTAud2VicA',
        'desc': isArabic ? l10n.meccaDesc : 'The Holiest City.',
        'location': isArabic ? 'غرب المملكة العربية السعودية' : 'Western Saudi Arabia',
        'region': 'western',
        'rating': 5.0,
        'weather': '35°C',
        'weatherDesc': isArabic ? 'حار' : 'Hot',
        'categories': ['religious'],
      },
      {
        'id': 'medina',
        'name': isArabic ? l10n.cityMedina : 'Medina',
        'image': 'https://imgs.search.brave.com/Vw9LKhc4NRoutW76wWyEoda0MQ0xpuZpXb1C72EWl_o/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMuc3JwY2RpZ2l0/YWwuY29tL3N0eWxl/cy8xMDM3eGF1dG8v/cHVibGljLzIwMTQv/MDQvMDEvMTM5NTg0/OTgzODgzNDI2Nzgw/MC5qcGcud2VicA',
        'desc': isArabic ? l10n.medinaDesc : 'The City of the Prophet.',
        'location': isArabic ? 'غرب المملكة العربية السعودية' : 'Western Saudi Arabia',
        'region': 'western',
        'rating': 4.9,
        'weather': '30°C',
        'weatherDesc': isArabic ? 'صافي' : 'Clear',
        'categories': ['religious'],
      },
      {
        'id': 'alula',
        'name': isArabic ? l10n.cityAlUla : 'AlUla',
        'image': 'https://imgs.search.brave.com/3ohePEn2eXWVmhzPiKjxe0F-lyEUvyHpXl_x4OX5FAA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jbXMu/ZmFjdG1hZ2F6aW5l/cy5jb20vd3AtY29u/dGVudC91cGxvYWRz/LzIwMjQvMDMvRWxl/cGhhbnQtUm9jay1B/bFVsYS5qcGVn',
        'desc': isArabic ? l10n.alUlaDesc : 'Historic Oasis.',
        'location': isArabic ? 'شمال غرب المملكة العربية السعودية' : 'Northwestern Saudi Arabia',
        'region': 'northwestern',
        'rating': 4.9,
        'weather': '28°C',
        'weatherDesc': isArabic ? 'صافي' : 'Clear',
        'categories': ['adventure', 'luxury'],
      },
      {
        'id': 'abha',
        'name': isArabic ? l10n.cityAbha : 'Abha',
        'image': 'https://imgs.search.brave.com/DorlFb3ge3AyW55M6d8146QQy4L4midmisfemf1Wkfk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jbm4t/YXJhYmljLWltYWdl/cy5jbm4uaW8vY2xv/dWRpbmFyeS9pbWFn/ZS91cGxvYWQvd18x/OTIwLGNfc2NhbGUs/cV9hdXRvL2NubmFy/YWJpYy8yMDIxLzA1/LzA0L2ltYWdlcy8x/ODQxNDAuanBn',
        'desc': isArabic ? l10n.abhaDesc : 'The City of Fog.',
        'location': isArabic ? 'جنوب المملكة العربية السعودية' : 'Southern Saudi Arabia',
        'region': 'southern',
        'rating': 4.6,
        'weather': '22°C',
        'weatherDesc': isArabic ? 'غائم جزئياً' : 'Partly Cloudy',
        'categories': ['family', 'adventure'],
      },
    ];
  }

  static String getCityImage(String cityName) {
    switch (cityName.toLowerCase()) {
      case 'riyadh':
      case 'الرياض':
        return 'https://i.pinimg.com/736x/87/d0/19/87d0197cf80132e528551adeccf5ccd3.jpg';
      case 'jeddah':
      case 'جدة':
        return 'https://i.pinimg.com/1200x/85/cb/65/85cb65a75d0980ae3373cf1b3262adbc.jpg';
      case 'mecca':
      case 'مكة المكرمة':
        return 'https://imgs.search.brave.com/PnK0zW92qAFCLJM77Xi8cfkUQvjTKraHSk1GgSRY-0c/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbmcu/cG5ndHJlZS5jb20v/dGh1bWJfYmFjay9m/aDI2MC9iYWNrZ3Jv/dW5kLzIwMjUwNzAz/L3BuZ3RyZWUtYWVy/aWFsLXZpZXctb2Yt/dGhlLWthYWJhLWlu/LW1lY2NhLWlsbHVt/aW5hdGVkLWF0LW5p/Z2h0LXN1cnJvdW5k/ZWQtaW1hZ2VfMTc0/NTY4NTAud2VicA';
      case 'medina':
      case 'المدينة المنورة':
        return 'https://imgs.search.brave.com/Vw9LKhc4NRoutW76wWyEoda0MQ0xpuZpXb1C72EWl_o/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMuc3JwY2RpZ2l0/YWwu/Y29tL3N0eWxl/cy8xMDM3eGF1dG8v/cHVibGljLzIwMTQv/MDQvMDEvMTM5NTg0/OTgzODgzNDI2Nzgw/MC5qcGcud2VicA';
      case 'alula':
      case 'العلا':
        return 'https://imgs.search.brave.com/3ohePEn2eXWVmhzPiKjxe0F-lyEUvyHpXl_x4OX5FAA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jbXMu/ZmFjdG1hZ2F6aW5l/cy5jb20vd3AtY29u/dGVudC91cGxvYWRz/LzIwMjQvMDMvRWxl/cGhhbnQtUm9jay1B/bFVsYS5qcGVn';
      case 'abha':
      case 'أبها':
        return 'https://imgs.search.brave.com/DorlFb3ge3AyW55M6d8146QQy4L4midmisfemf1Wkfk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jbm4t/YXJhYmljLWltYWdl/cy5jbm4uaW8vY2xv/dWRpbmFyeS9pbWFn/ZS91cGxvYWQvd18x/OTIwLGNfc2NhbGUs/cV9hdXRvL2NubmFy/YWJpYy8yMDIxLzA1/LzA0L2ltYWdlcy8x/ODQxNDAuanBn';
      default:
        return 'https://i.pinimg.com/736x/87/d0/19/87d0197cf80132e528551adeccf5ccd3.jpg';
    }
  }
}
