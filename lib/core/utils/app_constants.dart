import '../../l10n/app_localizations.dart';

class AppConstants {
  static List<Map<String, dynamic>> getCities(AppLocalizations l10n, bool isArabic) {
    return [
      {
        'id': 'riyadh',
        'name': isArabic ? l10n.cityRiyadh : 'Riyadh',
        'image': 'https://i.pinimg.com/736x/87/d0/19/87d0197cf80132e528551adeccf5ccd3.jpg',
        'desc': isArabic ? l10n.riyadhDesc : 'The capital and financial hub.',
        'location': isArabic ? l10n.locationRiyadh : 'Central Saudi Arabia (Capital)',
        'region': 'central',
        'rating': 4.8,
        'weather': '32°C',
        'weatherDesc': isArabic ? 'مشمس' : 'Sunny',
        'categories': ['business', 'luxury'],
        'topPlaces': isArabic
            ? ['برج المملكة', 'البوليفارد', 'الدرعية التاريخية', 'حافة العالم']
            : ['Kingdom Tower', 'Boulevard', 'Historic Diriyah', 'Edge of the World'],
        'activities': isArabic
            ? {'ترفيه': ['موسم الرياض'], 'مغامرة': ['رحلات بر'], 'تسوق': ['مولات']}
            : {'Entertainment': ['Riyadh Season'], 'Adventure': ['Desert Trips'], 'Shopping': ['Malls']}
      },
      {
        'id': 'jeddah',
        'name': isArabic ? l10n.cityJeddah : 'Jeddah',
        'image': 'https://i.pinimg.com/1200x/85/cb/65/85cb65a75d0980ae3373cf1b3262adbc.jpg',
        'desc': isArabic ? l10n.jeddahDesc : 'The Bride of the Red Sea.',
        'location': isArabic ? l10n.locationJeddah : 'Western Saudi Arabia',
        'region': 'western',
        'rating': 4.7,
        'weather': '30°C',
        'weatherDesc': isArabic ? 'رطب' : 'Humid',
        'categories': ['luxury', 'family'],
        'topPlaces': isArabic ? ['كورنيش جدة', 'البلد'] : ['Jeddah Corniche', 'Al-Balad'],
        'activities': isArabic ? {'بحر': ['غوص']} : {'Sea': ['Diving']}
      },
      {
        'id': 'taif',
        'name': isArabic ? l10n.cityTaif : 'Taif',
        'image': 'https://goldenhost.co/blog/wp-content/uploads/2025/03/%D8%BA%D8%BA%D9%81%D9%81%D8%B9%D9%81%D8%B9%D8%B9%D9%81%D8%B9%D9%81-1024x576.jpg',
        'desc': isArabic ? l10n.taifDesc : 'The Bride of Resorts.',
        'location': isArabic ? l10n.locationTaif : 'Western Saudi Arabia',
        'region': 'western',
        'rating': 4.5,
        'weather': '24°C',
        'weatherDesc': isArabic ? 'معتدل' : 'Moderate',
        'categories': ['family', 'nature'],
        'topPlaces': isArabic ? ['الهدا', 'الشفا'] : ['Al Hada', 'Ash Shafa'],
        'activities': isArabic ? {'طبيعة': ['مزارع الورد']} : {'Nature': ['Rose Farms']}
      },
      {
        'id': 'najran',
        'name': isArabic ? l10n.cityNajran : 'Najran',
        'image': 'https://media.gettyimages.com/id/1455349081/photo/saudi-arabia-najran-province-najran-aerial-view-of-historic-al-aan-palace.jpg?s=612x612&w=0&k=20&c=eMI1Rot-1OaGrsE1cuCfS_x4VySKOvu9Q_Fd5YzD0ow=',
        'desc': isArabic ? l10n.najranDesc : 'Ancient Historic City.',
        'location': isArabic ? l10n.locationNajran : 'Southern Saudi Arabia',
        'region': 'southern',
        'rating': 4.4,
        'weather': '28°C',
        'weatherDesc': isArabic ? 'صافي' : 'Clear',
        'categories': ['history', 'adventure'],
        'topPlaces': isArabic ? ['الأخدود الأثري'] : ['Archaeological Al-Ukhdood'],
        'activities': isArabic ? {'تاريخ': ['مواقع أثرية']} : {'History': ['Archaeological Sites']}
      },
      {
        'id': 'tabuk',
        'name': isArabic ? l10n.cityTabuk : 'Tabuk',
        'image': 'https://saudipedia.com/var/site/storage/images/2/8/6/7/4347682-1-ara-SA/4eeb5ebd3b99-65618.jpg',
        'desc': isArabic ? l10n.tabukDesc : 'Gateway to the North.',
        'location': isArabic ? l10n.locationTabuk : 'Northern Saudi Arabia',
        'region': 'northern',
        'rating': 4.6,
        'weather': '18°C',
        'weatherDesc': isArabic ? 'بارد' : 'Cold',
        'categories': ['nature', 'adventure'],
        'topPlaces': isArabic ? ['وادي الديسة'] : ['Wadi Al Disah'],
        'activities': isArabic ? {'مغامرة': ['وديان']} : {'Adventure': ['Valleys']}
      },
      {
        'id': 'baha',
        'name': isArabic ? l10n.cityBaha : 'Al Baha',
        'image': 'https://bahaadmin.baha.gov.sa/Uploads/Images/26982915-6221-4577-ae49-783540b77467_WhatsApp%20Image%202023-01-14%20at%207.26.24%20PM%20(1).jpeg',
        'desc': isArabic ? l10n.bahaDesc : 'The Pearl of the Mountains.',
        'location': isArabic ? l10n.locationBaha : 'Southwestern Saudi Arabia',
        'region': 'southern',
        'rating': 4.5,
        'weather': '20°C',
        'weatherDesc': isArabic ? 'غائم' : 'Cloudy',
        'categories': ['nature', 'adventure'],
        'topPlaces': isArabic ? ['غابة رغدان', 'قرية ذي عين'] : ['Raghadan Forest', 'Thee Ain Village'],
        'activities': isArabic ? {'طبيعة': ['غابات']} : {'Nature': ['Forests']}
      },
      {
        'id': 'abha',
        'name': isArabic ? l10n.cityAbha : 'Abha',
        'image': 'https://imgs.search.brave.com/DorlFb3ge3AyW55M6d8146QQy4L4midmisfemf1Wkfk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jbm4t/YXJhYmljLWltYWdl/cy5jbm4uaW8vY2xv/dWRpbmFyeS9pbWFn/ZS91cGxvYWQvd18x/OTIwLGNfc2NhbGUs/cV9hdXRvL2NubmFy/YWJpYy8yMDIxLzA1/LzA0L2ltYWdlcy8x/ODQxNDAuanBn',
        'desc': isArabic ? l10n.abhaDesc : 'The City of Fog.',
        'location': isArabic ? l10n.locationAbha : 'Southwestern Saudi Arabia',
        'region': 'southern',
        'rating': 4.6,
        'weather': '22°C',
        'weatherDesc': isArabic ? 'غائم' : 'Cloudy',
        'categories': ['family', 'adventure'],
        'topPlaces': isArabic ? ['السودة', 'رجال ألمع'] : ['Al Souda', 'Rijal Almaa'],
        'activities': isArabic ? {'مغامرة': ['تلفريك']} : {'Adventure': ['Teleferic']}
      },
      {
        'id': 'neom',
        'name': isArabic ? l10n.cityNeom : 'NEOM',
        'image': 'http://dealapp.sa/blog/wp-content/uploads/2023/05/%D9%85%D8%B4%D8%B1%D9%88%D8%B9-%D9%86%D9%8A%D9%88%D9%85.png',
        'desc': isArabic ? l10n.neomDesc : 'The City of the Future.',
        'location': isArabic ? l10n.locationNeom : 'Northwestern Saudi Arabia',
        'region': 'northwestern',
        'rating': 4.9,
        'weather': '26°C',
        'weatherDesc': isArabic ? 'صافي' : 'Clear',
        'categories': ['luxury', 'business'],
        'topPlaces': isArabic ? ['ذا لاين'] : ['The Line'],
        'activities': isArabic ? {'مستقبل': ['تجارب تقنية']} : {'Future': ['Tech Experiences']}
      },
      {
        'id': 'dammam',
        'name': isArabic ? 'الدمام' : 'Dammam',
        'image': 'http://dealapp.sa/blog/wp-content/uploads/2020/05/%D8%AC%D8%B2%D9%8A%D8%B1%D8%A9-%D8%A7%D9%84%D9%85%D8%B1%D8%AC%D8%A7%D9%86-4.jpg',
        'desc': isArabic ? l10n.dammamDesc : 'Coastal Eastern City.',
        'location': isArabic ? l10n.locationDammamKhobar : 'Eastern Saudi Arabia',
        'region': 'eastern',
        'rating': 4.6,
        'weather': '28°C',
        'weatherDesc': isArabic ? 'رطب' : 'Humid',
        'categories': ['family', 'luxury'],
        'topPlaces': isArabic ? ['كورنيش الخبر'] : ['Khobar Corniche'],
        'activities': isArabic ? {'بحر': ['سباحة']} : {'Sea': ['Swimming']}
      },
      {
        'id': 'jazan',
        'name': isArabic ? l10n.cityJazan : 'Jazan',
        'image': 'https://saudipedia.com/var/site/storage/images/2/2/8/9/5539822-1-ara-SA/e918debaf9ba-65707.jpg',
        'desc': isArabic ? l10n.jazanDesc : 'Nature and Environment Diversity.',
        'location': isArabic ? l10n.locationJazan : 'Southwestern Saudi Arabia',
        'region': 'southern',
        'rating': 4.4,
        'weather': '30°C',
        'weatherDesc': isArabic ? 'حار رطب' : 'Hot & Humid',
        'categories': ['nature', 'adventure'],
        'topPlaces': isArabic ? ['جزر فرسان'] : ['Farasan Islands'],
        'activities': isArabic ? {'طبيعة': ['استوائية']} : {'Nature': ['Tropical']}
      },
      {
        'id': 'farasan',
        'name': isArabic ? l10n.cityFarasan : 'Farasan Islands',
        'image': 'https://imgs.search.brave.com/EE0nknbTw7CswoJ-pscCrJij6Onv7uQOjRfPSUHCVWU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jbm4t/YXJhYmljLWltYWdl/cy5jbm4uaW8vY2xv/dWRpbmFyeS9pbWFn/ZS91cGxvYWQvd185/MjQsaF81MjAsY19m/aWxsLHFfYXV0byxn/X2NlbnRlci9jbm5h/cmFiaWMvMjAyMS8w/OS8xNi9pbWFnZXMv/MTkzNjg1LmpwZw',
        'desc': isArabic ? l10n.farasanDesc : 'Pristine Archipelago.',
        'location': isArabic ? l10n.locationFarasan : 'Near Jazan',
        'region': 'southern',
        'rating': 4.7,
        'weather': '29°C',
        'weatherDesc': isArabic ? 'مشمس' : 'Sunny',
        'categories': ['nature', 'adventure'],
        'topPlaces': isArabic ? ['الشواطئ البكر'] : ['Pristine Beaches'],
        'activities': isArabic ? {'بحر': ['غوص']} : {'Sea': ['Diving']}
      },
      {
        'id': 'alula',
        'name': isArabic ? l10n.cityAlUla : 'AlUla',
        'image': 'https://cms.factmagazines.com/wp-content/uploads/2024/03/Elephant-Rock-AlUla.jpeg',
        'desc': isArabic ? l10n.alUlaDesc : 'Historic Oasis.',
        'location': isArabic ? l10n.locationAlUla : 'Northwestern Saudi Arabia',
        'region': 'northwestern',
        'rating': 4.9,
        'weather': '28°C',
        'weatherDesc': isArabic ? 'صافي' : 'Clear',
        'categories': ['adventure', 'luxury'],
        'topPlaces': isArabic ? ['مدائن صالح'] : ['Madain Salih'],
        'activities': isArabic ? {'مغامرة': ['منطاد']} : {'Adventure': ['Hot Air Balloon']}
      },
      {
        'id': 'mecca',
        'name': isArabic ? l10n.cityMecca : 'Mecca',
        'image': 'https://imgs.search.brave.com/1HqcI-ZqcocK-9R1mKrm95mP3PBPAhh_1WEQJ0lkJu0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbmcu/cG5ndHJlZS5jb20v/dGh1bWJfYmFjay9m/aDI2MC9iYWNrZ3Jv/dW5kLzIwMjMwNTI3/L3BuZ3RyZWUtdGhl/LWxhcmdlLWlzbGFt/aWMtbW9zcXVlLWlu/LXRoZS1ob2x5LWNp/dHktb2YtbWVjY2Et/YXQtaW1hZ2VfMjY5/MjQ5Ni5qcGc',
        'desc': isArabic ? l10n.meccaDesc : 'The Holiest City.',
        'location': isArabic ? l10n.locationMecca : 'Western Saudi Arabia',
        'region': 'western',
        'rating': 5.0,
        'weather': '35°C',
        'weatherDesc': isArabic ? 'حار' : 'Hot',
        'categories': ['religious'],
        'topPlaces': isArabic ? ['المسجد الحرام'] : ['Grand Mosque'],
        'activities': isArabic ? {'ديني': ['عمرة']} : {'Religious': ['Umrah']}
      },
      {
        'id': 'medina',
        'name': isArabic ? l10n.cityMedina : 'Medina',
        'image': 'https://static.srpcdigital.com/styles/1037xauto/public/2014/04/01/1395849838834267800.jpg.webp',
        'desc': isArabic ? l10n.medinaDesc : 'The City of the Prophet.',
        'location': isArabic ? l10n.locationMedina : 'Western Saudi Arabia',
        'region': 'western',
        'rating': 4.9,
        'weather': '30°C',
        'weatherDesc': isArabic ? 'صافي' : 'Clear',
        'categories': ['religious'],
        'topPlaces': isArabic ? ['المسجد النبوي'] : ['Prophet\'s Mosque'],
        'activities': isArabic ? {'ديني': ['زيارة']} : {'Religious': ['Visiting']}
      },
    ];
  }

  static String getCityImage(String cityName) {
    final name = cityName.toLowerCase();

    if (name.contains('riyadh') || name.contains('رياض')) return 'https://i.pinimg.com/736x/87/d0/19/87d0197cf80132e528551adeccf5ccd3.jpg';
    if (name.contains('jeddah') || name.contains('جدة')) return 'https://i.pinimg.com/1200x/85/cb/65/85cb65a75d0980ae3373cf1b3262adbc.jpg';
    if (name.contains('mecca') || name.contains('مكة')) return 'https://imgs.search.brave.com/1HqcI-ZqcocK-9R1mKrm95mP3PBPAhh_1WEQJ0lkJu0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbmcu/cG5ndHJlZS5jb20v/dGh1bWJfYmFjay9m/aDI2MC9iYWNrZ3Jv/dW5kLzIwMjMwNTI3/L3BuZ3RyZWUtdGhl/LWxhcmdlLWlzbGFt/aWMtbW9zcXVlLWlu/LXRoZS1ob2x5LWNp/dHktb2YtbWVjY2Et/YXQtaW1hZ2VfMjY5/MjQ5Ni5qcGc';
    if (name.contains('medina') || name.contains('مدينة')) return 'https://static.srpcdigital.com/styles/1037xauto/public/2014/04/01/1395849838834267800.jpg.webp';
    if (name.contains('alula') || name.contains('علا')) return 'https://cms.factmagazines.com/wp-content/uploads/2024/03/Elephant-Rock-AlUla.jpeg';
    if (name.contains('abha') || name.contains('أبها')) return 'https://imgs.search.brave.com/DorlFb3ge3AyW55M6d8146QQy4L4midmisfemf1Wkfk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jbm4t/YXJhYmljLWltYWdl/cy5jbm4uaW8vY2xv/dWRpbmFyeS9pbWFn/ZS91cGxvYWQvd18x/OTIwLGNfc2NhbGUs/cV9hdXRvL2NubmFy/YWJpYy8yMDIxLzA1/LzA0L2ltYWdlcy8x/ODQxNDAuanBn';
    if (name.contains('taif') || name.contains('طائف')) return 'https://goldenhost.co/blog/wp-content/uploads/2025/03/%D8%BA%D8%BA%D9%81%D9%81%D8%B9%D9%81%D8%B9%D8%B9%D9%81%D8%B9%D9%81-1024x576.jpg';
    if (name.contains('najran') || name.contains('نجران')) return 'https://media.gettyimages.com/id/1455349081/photo/saudi-arabia-najran-province-najran-aerial-view-of-historic-al-aan-palace.jpg?s=612x612&w=0&k=20&c=eMI1Rot-1OaGrsE1cuCfS_x4VySKOvu9Q_Fd5YzD0ow=';
    if (name.contains('tabuk') || name.contains('تبوك')) return 'https://saudipedia.com/var/site/storage/images/2/8/6/7/4347682-1-ara-SA/4eeb5ebd3b99-65618.jpg';
    if (name.contains('baha') || name.contains('باحة')) return 'https://bahaadmin.baha.gov.sa/Uploads/Images/26982915-6221-4577-ae49-783540b77467_WhatsApp%20Image%202023-01-14%20at%207.26.24%20PM%20(1).jpeg';
    if (name.contains('neom') || name.contains('نيوم')) return 'http://dealapp.sa/blog/wp-content/uploads/2023/05/%D9%85%D8%B4%D8%B1%D9%88%D8%B9-%D9%86%D9%8A%D9%88%D9%85.png';
    if (name.contains('dammam') || name.contains('دمام')) return 'http://dealapp.sa/blog/wp-content/uploads/2020/05/%D8%AC%D8%B2%D9%8A%D8%B1%D8%A9-%D8%A7%D9%84%D9%85%D8%B1%D8%AC%D8%A7%D9%86-4.jpg';
    if (name.contains('jazan') || name.contains('جازان')) return 'https://saudipedia.com/var/site/storage/images/2/2/8/9/5539822-1-ara-SA/e918debaf9ba-65707.jpg';
    if (name.contains('farasan') || name.contains('فرسان')) return 'https://imgs.search.brave.com/EE0nknbTw7CswoJ-pscCrJij6Onv7uQOjRfPSUHCVWU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jbm4t/YXJhYmljLWltYWdl/cy5jbm4uaW8vY2xv/dWRpbmFyeS9pbWFn/ZS91cGxvYWQvd185/MjQsaF81MjAsY19m/aWxsLHFfYXV0byxn/X2NlbnRlci9jbm5h/cmFiaWMvMjAyMS8w/OS8xNi9pbWFnZXMv/MTkzNjg1LmpwZw';

    return 'https://i.pinimg.com/736x/87/d0/19/87d0197cf80132e528551adeccf5ccd3.jpg';
  }
}
