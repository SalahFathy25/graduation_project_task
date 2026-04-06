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
            ? ['برج المملكة', 'البوليفارد (موسم الرياض)', 'الدرعية التاريخية', 'حافة العالم (Edge of the World)']
            : ['Kingdom Tower', 'Boulevard (Riyadh Season)', 'Historic Diriyah', 'Edge of the World'],
        'activities': isArabic 
            ? {
                'ترفيه': ['موسم الرياض', 'ألعاب', 'حفلات'],
                'مغامرة': ['رحلات بر', 'هايكينج', 'تسلق'],
                'تسوق': ['مولات ضخمة'],
                'مطاعم': ['مطاعم وتجارب فاخرة']
              }
            : {
                'Entertainment': ['Riyadh Season', 'Games', 'Concerts'],
                'Adventure': ['Desert Trips', 'Hiking', 'Climbing'],
                'Shopping': ['Large Malls'],
                'Dining': ['Fine Dining & Luxury Experiences']
              }
      },
      {
        'id': 'jeddah',
        'name': isArabic ? l10n.cityJeddah : 'Jeddah',
        'image': 'https://i.pinimg.com/1200x/85/cb/65/85cb65a75d0980ae3373cf1b3262adbc.jpg',
        'desc': isArabic ? l10n.jeddahDesc : 'The Bride of the Red Sea.',
        'location': isArabic ? l10n.locationJeddah : 'Western Saudi Arabia on the Red Sea',
        'region': 'western',
        'rating': 4.7,
        'weather': '30°C',
        'weatherDesc': isArabic ? 'رطب' : 'Humid',
        'categories': ['luxury', 'family'],
        'topPlaces': isArabic 
            ? ['كورنيش جدة', 'البلد التاريخية', 'نادي اليخوت', 'البحر الأحمر']
            : ['Jeddah Corniche', 'Historic Al-Balad', 'Yacht Club', 'Red Sea'],
        'activities': isArabic 
            ? {
                'بحر': ['جيتسكي', 'غوص', 'باراشوت', 'قوارب'],
                'استرخاء': ['جلسات بحرية'],
                'تسوق': ['رد سي مول'],
                'فعاليات': ['موسم جدة']
              }
            : {
                'Sea': ['Jet Ski', 'Diving', 'Parachute', 'Boats'],
                'Relaxation': ['Sea Lounges'],
                'Shopping': ['Red Sea Mall'],
                'Events': ['Jeddah Season']
              }
      },
      {
        'id': 'taif',
        'name': isArabic ? l10n.cityTaif : 'Taif',
        'image': 'https://i.pinimg.com/1200x/6d/4a/6a/6d4a6a0e695d774888846c4309325852.jpg',
        'desc': isArabic ? l10n.taifDesc : 'The Bride of Resorts.',
        'location': isArabic ? l10n.locationTaif : 'Western Saudi Arabia near Mecca',
        'region': 'western',
        'rating': 4.5,
        'weather': '24°C',
        'weatherDesc': isArabic ? 'معتدل' : 'Moderate',
        'categories': ['family', 'nature'],
        'topPlaces': isArabic 
            ? ['الهدا', 'الشفا', 'مزارع الورد', 'قصر شبرا']
            : ['Al Hada', 'Ash Shafa', 'Rose Farms', 'Shubra Palace'],
        'activities': isArabic 
            ? {
                'ثقافة': ['مهرجان الورد'],
                'طبيعة': ['جبال ومنتجعات'],
                'مغامرة': ['تلفريك'],
                'استرخاء': ['أجواء معتدلة']
              }
            : {
                'Culture': ['Rose Festival'],
                'Nature': ['Mountains & Resorts'],
                'Adventure': ['Teleferic'],
                'Relaxation': ['Moderate Weather']
              }
      },
      {
        'id': 'najran',
        'name': isArabic ? l10n.cityNajran : 'Najran',
        'image': 'https://i.pinimg.com/1200x/1e/8e/8e/1e8e8e78888a78888a78888a78888a78.jpg',
        'desc': isArabic ? l10n.najranDesc : 'Ancient Historic City.',
        'location': isArabic ? l10n.locationNajran : 'Southern Saudi Arabia on the border with Yemen',
        'region': 'southern',
        'rating': 4.4,
        'weather': '28°C',
        'weatherDesc': isArabic ? 'صافي' : 'Clear',
        'categories': ['history', 'adventure'],
        'topPlaces': isArabic 
            ? ['الأخدود الأثري', 'القرى الطينية', 'الواحات']
            : ['Archaeological Al-Ukhdood', 'Mud Villages', 'Oases'],
        'activities': isArabic 
            ? {
                'صحاري': ['رحلات سفاري'],
                'تاريخ': ['مواقع أثرية'],
                'استكشاف': ['واحات وزراعة']
              }
            : {
                'Deserts': ['Safari Trips'],
                'History': ['Archaeological Sites'],
                'Exploration': ['Oases & Agriculture']
              }
      },
      {
        'id': 'tabuk',
        'name': isArabic ? l10n.cityTabuk : 'Tabuk',
        'image': 'https://i.pinimg.com/1200x/2a/2a/2a/2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a.jpg',
        'desc': isArabic ? l10n.tabukDesc : 'Gateway to the North.',
        'location': isArabic ? l10n.locationTabuk : 'Northern Saudi Arabia',
        'region': 'northern',
        'rating': 4.6,
        'weather': '18°C',
        'weatherDesc': isArabic ? 'بارد' : 'Cold',
        'categories': ['nature', 'adventure'],
        'topPlaces': isArabic 
            ? ['وادي الديسة', 'الجبال', 'المناطق الثلجية شتاءً']
            : ['Wadi Al Disah', 'Mountains', 'Snowy Areas in Winter'],
        'activities': isArabic 
            ? {
                'شتاء': ['ثلوج'],
                'مغامرة': ['وديان'],
                'تصوير': ['طبيعة']
              }
            : {
                'Winter': ['Snow'],
                'Adventure': ['Valleys'],
                'Photography': ['Nature']
              }
      },
      {
        'id': 'baha',
        'name': isArabic ? l10n.cityBaha : 'Al Baha',
        'image': 'https://i.pinimg.com/1200x/3b/3b/3b/3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b3b.jpg',
        'desc': isArabic ? l10n.bahaDesc : 'The Pearl of the Mountains.',
        'location': isArabic ? l10n.locationBaha : 'Southwestern Saudi Arabia between Taif and Abha',
        'region': 'southern',
        'rating': 4.5,
        'weather': '20°C',
        'weatherDesc': isArabic ? 'غائم' : 'Cloudy',
        'categories': ['nature', 'adventure'],
        'topPlaces': isArabic 
            ? ['غابة رغدان', 'قرية ذي عين', 'الشلالات الطبيعية']
            : ['Raghadan Forest', 'Thee Ain Village', 'Natural Waterfalls'],
        'activities': isArabic 
            ? {
                'طبيعة': ['غابات', 'شلالات'],
                'مغامرة': ['تسلق', 'رحلات'],
                'تصوير': ['مناظر خيالية']
              }
            : {
                'Nature': ['Forests', 'Waterfalls'],
                'Adventure': ['Climbing', 'Trips'],
                'Photography': ['Stunning Landscapes']
              }
      },
      {
        'id': 'abha',
        'name': isArabic ? l10n.cityAbha : 'Abha',
        'image': 'https://imgs.search.brave.com/DorlFb3ge3AyW55M6d8146QQy4L4midmisfemf1Wkfk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jbm4t/YXJhYmljLWltYWdl/cy5jbm4uaW8vY2xv/dWRpbmFyeS9pbWFn/ZS91cGxvYWQvd18x/OTIwLGNfc2NhbGUs/cV9hdXRvL2NubmFy/YWJpYy8yMDIxLzA1/LzA0L2ltYWdlcy8x/ODQxNDAuanBn',
        'desc': isArabic ? l10n.abhaDesc : 'The City of Fog.',
        'location': isArabic ? l10n.locationAbha : 'Southwestern Saudi Arabia (Asir Region)',
        'region': 'southern',
        'rating': 4.6,
        'weather': '22°C',
        'weatherDesc': isArabic ? 'غائم جزئياً' : 'Partly Cloudy',
        'categories': ['family', 'adventure'],
        'topPlaces': isArabic 
            ? ['السودة', 'رجال ألمع', 'التلفريك', 'منتزه عسير']
            : ['Al Souda', 'Rijal Almaa', 'Teleferic', 'Asir Park'],
        'activities': isArabic 
            ? {
                'طبيعة': ['جبال', 'ضباب', 'هايكينج'],
                'مغامرة': ['تلفريك', 'تسلق'],
                'ثقافة': ['قرى تراثية'],
                'استرخاء': ['أجواء باردة']
              }
            : {
                'Nature': ['Mountains', 'Fog', 'Hiking'],
                'Adventure': ['Teleferic', 'Climbing'],
                'Culture': ['Heritage Villages'],
                'Relaxation': ['Cool Weather']
              }
      },
      {
        'id': 'neom',
        'name': isArabic ? l10n.cityNeom : 'NEOM',
        'image': 'https://i.pinimg.com/1200x/4e/4e/4e/4e4e4e4e4e4e4e4e4e4e4e4e4e4e4e4e.jpg',
        'desc': isArabic ? l10n.neomDesc : 'The City of the Future.',
        'location': isArabic ? l10n.locationNeom : 'Northwestern Saudi Arabia (on the Red Sea)',
        'region': 'northwestern',
        'rating': 4.9,
        'weather': '26°C',
        'weatherDesc': isArabic ? 'صافي' : 'Clear',
        'categories': ['luxury', 'business'],
        'topPlaces': isArabic 
            ? ['ذا لاين', 'الشواطئ البكر', 'الجبال']
            : ['The Line', 'Pristine Beaches', 'Mountains'],
        'activities': isArabic 
            ? {
                'مستقبل': ['تجارب تقنية'],
                'بحر': ['غوص', 'قوارب'],
                'مغامرة': ['تسلق', 'هايكينج'],
                'رفاهية': ['منتجعات فاخرة']
              }
            : {
                'Future': ['Tech Experiences'],
                'Sea': ['Diving', 'Boats'],
                'Adventure': ['Climbing', 'Hiking'],
                'Luxury': ['Luxury Resorts']
              }
      },
      {
        'id': 'dammam',
        'name': isArabic ? 'الدمام والخبر' : 'Dammam & Khobar',
        'image': 'https://i.pinimg.com/1200x/5e/5e/5e/5e5e5e5e5e5e5e5e5e5e5e5e5e5e5e5e.jpg',
        'desc': isArabic ? l10n.dammamDesc : 'Coastal Eastern City.',
        'location': isArabic ? l10n.locationDammamKhobar : 'Eastern Saudi Arabia on the Arabian Gulf',
        'region': 'eastern',
        'rating': 4.6,
        'weather': '28°C',
        'weatherDesc': isArabic ? 'رطب' : 'Humid',
        'categories': ['family', 'luxury'],
        'topPlaces': isArabic 
            ? ['كورنيش الخبر', 'شاطئ نصف القمر', 'الواجهة البحرية']
            : ['Khobar Corniche', 'Half Moon Bay', 'Waterfront'],
        'activities': isArabic 
            ? {
                'بحر': ['سباحة', 'قوارب'],
                'تسوق': ['مجمعات'],
                'مطاعم': ['جلسات بحرية']
              }
            : {
                'Sea': ['Swimming', 'Boats'],
                'Shopping': ['Malls'],
                'Dining': ['Sea Lounges']
              }
      },
      {
        'id': 'jazan',
        'name': isArabic ? l10n.cityJazan : 'Jazan',
        'image': 'https://i.pinimg.com/1200x/6f/6f/6f/6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f.jpg',
        'desc': isArabic ? l10n.jazanDesc : 'Nature and Environment Diversity.',
        'location': isArabic ? l10n.locationJazan : 'Southwestern Saudi Arabia',
        'region': 'southern',
        'rating': 4.4,
        'weather': '30°C',
        'weatherDesc': isArabic ? 'حار رطب' : 'Hot & Humid',
        'categories': ['nature', 'adventure'],
        'topPlaces': isArabic 
            ? ['الجبال', 'البحر', 'جزر فرسان']
            : ['Mountains', 'Sea', 'Farasan Islands'],
        'activities': isArabic 
            ? {
                'طبيعة': ['استوائية'],
                'بحر': ['رحلات'],
                'مغامرة': ['جبال']
              }
            : {
                'Nature': ['Tropical'],
                'Sea': ['Trips'],
                'Adventure': ['Mountains']
              }
      },
      {
        'id': 'farasan',
        'name': isArabic ? l10n.cityFarasan : 'Farasan Islands',
        'image': 'https://i.pinimg.com/1200x/7f/7f/7f/7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f.jpg',
        'desc': isArabic ? l10n.farasanDesc : 'Pristine Archipelago.',
        'location': isArabic ? l10n.locationFarasan : 'Southwestern Saudi Arabia (near Jazan)',
        'region': 'southern',
        'rating': 4.7,
        'weather': '29°C',
        'weatherDesc': isArabic ? 'مشمس' : 'Sunny',
        'categories': ['nature', 'adventure'],
        'topPlaces': isArabic 
            ? ['الشواطئ البكر', 'الشعاب المرجانية', 'الحياة البحرية']
            : ['Pristine Beaches', 'Coral Reefs', 'Marine Life'],
        'activities': isArabic 
            ? {
                'بحر': ['غوص', 'سنوركل'],
                'مغامرة': ['قوارب'],
                'استرخاء': ['شواطئ هادئة']
              }
            : {
                'Sea': ['Diving', 'Snorkeling'],
                'Adventure': ['Boats'],
                'Relaxation': ['Calm Beaches']
              }
      },
      {
        'id': 'alula',
        'name': isArabic ? l10n.cityAlUla : 'AlUla',
        'image': 'https://imgs.search.brave.com/3ohePEn2eXWVmhzPiKjxe0F-lyEUvyHpXl_x4OX5FAA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jbXMu/ZmFjdG1hZ2F6aW5l/cy5jb20vd3AtY29u/dGVudC91cGxvYWRz/LzIwMjQvMDMvRWxl/cGhhbnQtUm9jay1B/bFVsYS5qcGVn',
        'desc': isArabic ? l10n.alUlaDesc : 'Historic Oasis.',
        'location': isArabic ? l10n.locationAlUla : 'Northwestern Saudi Arabia',
        'region': 'northwestern',
        'rating': 4.9,
        'weather': '28°C',
        'weatherDesc': isArabic ? 'صافي' : 'Clear',
        'categories': ['adventure', 'luxury'],
        'topPlaces': isArabic 
            ? ['مدائن صالح (العلا)', 'صخرة الفيل', 'الواحات']
            : ['Madain Salih', 'Elephant Rock', 'Oases'],
        'activities': isArabic 
            ? {
                'مغامرة': ['منطاد'],
                'استكشاف': ['آثار وصحاري'],
                'فعاليات': ['موسم العلا']
              }
            : {
                'Adventure': ['Hot Air Balloon'],
                'Exploration': ['Ruins & Deserts'],
                'Events': ['AlUla Season']
              }
      },
      {
        'id': 'mecca',
        'name': isArabic ? l10n.cityMecca : 'Mecca',
        'image': 'https://imgs.search.brave.com/PnK0zW92qAFCLJM77Xi8cfkUQvjTKraHSk1GgSRY-0c/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbmcu/cG5ndHJlZS5jb20v/dGh1bWJfYmFjay9m/aDI2MC9iYWNrZ3Jv/dW5kLzIwMjUwNzAz/L3BuZ3RyZWUtYWVy/aWFsLXZpZXctb2Yt/dGhlLWthYWJhLWlu/LW1l/Y2NhLWlsbHVt/aW5hdGVkLWF0LW5p/Z2h0LXN1cnJvdW5k/ZWQtaW1hZ2VfMTc0/NTY4NTAud2VicA',
        'desc': isArabic ? l10n.meccaDesc : 'The Holiest City.',
        'location': isArabic ? l10n.locationMecca : 'Western Saudi Arabia',
        'region': 'western',
        'rating': 5.0,
        'weather': '35°C',
        'weatherDesc': isArabic ? 'حار' : 'Hot',
        'categories': ['religious'],
        'topPlaces': isArabic 
            ? ['المسجد الحرام', 'برج الساعة', 'جبل النور']
            : ['Grand Mosque', 'Clock Tower', 'Jabal Al-Noor'],
        'activities': isArabic 
            ? {
                'ديني': ['عمرة', 'طواف'],
                'تسوق': ['أبراج البيت'],
                'روحاني': ['زيارات دينية']
              }
            : {
                'Religious': ['Umrah', 'Tawaf'],
                'Shopping': ['Abraj Al Bait'],
                'Spiritual': ['Religious Visits']
              }
      },
      {
        'id': 'medina',
        'name': isArabic ? l10n.cityMedina : 'Medina',
        'image': 'https://imgs.search.brave.com/Vw9LKhc4NRoutW76wWyEoda0MQ0xpuZpXb1C72EWl_o/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMuc3JwY2RpZ2l0/YWwuY29tL3N0eWxl/cy8xMDM3eGF1dG8v/cHVibGljLzIwMTQv/MDQvMDEvMTM5NTg0/OTgzODgzNDI2Nzgw/MC5qcGcud2VicA',
        'desc': isArabic ? l10n.medinaDesc : 'The City of the Prophet.',
        'location': isArabic ? l10n.locationMedina : 'Western Saudi Arabia north of Mecca',
        'region': 'western',
        'rating': 4.9,
        'weather': '30°C',
        'weatherDesc': isArabic ? 'صافي' : 'Clear',
        'categories': ['religious'],
        'topPlaces': isArabic 
            ? ['المسجد النبوي', 'مسجد قباء', 'جبل أحد']
            : ['Prophet\'s Mosque', 'Quba Mosque', 'Mount Uhud'],
        'activities': isArabic 
            ? {
                'ديني': ['زيارة المسجد النبوي'],
                'تاريخ': ['مواقع إسلامية'],
                'استرخاء': ['أجواء هادئة']
              }
            : {
                'Religious': ['Visiting Prophet\'s Mosque'],
                'History': ['Islamic Sites'],
                'Relaxation': ['Calm Atmosphere']
              }
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
        return 'https://imgs.search.brave.com/PnK0zW92qAFCLJM77Xi8cfkUQvjTKraHSk1GgSRY-0c/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbmcu/cG5ndHJlZS5jb20v/dGh1bWJfYmFjay9m/aDI2MC9iYWNrZ3Jv/dW5kLzIwMjUwNzAz/L3BuZ3RyZWUtYWVy/aWFsLXZpZXctb2Yt/dGhlLWthYWJhLWlu/LW1l/Y2NhLWlsbHVt/aW5hdGVkLWF0LW5p/Z2h0LXN1cnJvdW5k/ZWQtaW1hZ2VfMTc0/NTY4NTAud2VicA';
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
