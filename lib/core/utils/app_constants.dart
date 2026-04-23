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
        'categories': ['business', 'luxury', 'family'],
        'gallery': [
          'https://i.pinimg.com/736x/87/d0/19/87d0197cf80132e528551adeccf5ccd3.jpg',
          'https://imgs.search.brave.com/6hv3sFrTtdKKHlKLusAY1gpqvOJqe4T5oINmcR-iSbg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/YXJhYnNzdG9jay5j/b20vdXBsb2Fkcy9p/bWFnZXMvMzg1NDYv/YWVzdGhldGljLW9m/LXRoZS1jaXR5LXJp/eWFkaC10aHVtYm5h/aWwtMzg1NDYud2Vi/cA',
          'https://imgs.search.brave.com/YJZX77_WlCzPMuVal_XR-V0XL0ScqidBtDNsiyYYNyQ/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/YXJhYnNzdG9jay5j/b20vdXBsb2Fkcy9p/bWFnZXMvNDIxNTUv/YS1vZi10aGUtc3Ry/ZWV0cy1jaXR5LXRo/dW1ibmFpbC00MjE1/NS53ZWJw',
          'https://imgs.search.brave.com/M3Bn1T7LWcmEO70qRxKea6E2M3cs-VqTx10K5tvKHo8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9ibG9n/LmFqc3JwLmNvbS93/cC1jb250ZW50L3Vw/bG9hZHMvMjAyNC8x/MC8lRDklODUlRDkl/ODglRDklODIlRDgl/QjktJUQ4JUE3JUQ5/JTg0JUQ4JUIxJUQ5/JThBJUQ4JUE3JUQ4/JUI2LTY5NngzOTgu/anBn',
          'https://imgs.search.brave.com/IjT5_qit9Viok9paHMH7XOELIA9z7L4yFuidkXl2iJM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/YXJhYnNzdG9jay5j/b20vdXBsb2Fkcy9p/bWFnZXMvMzY1NDg0/L3RoZS1raW5nZG9t/LXRvd2VyLWJ1aWxk/aW5nLWluLXRodW1i/bmFpbC0zNjU0ODQu/d2VicA',
        ],
        'lat': 24.7136,
        'lng': 46.6753,
        'topPlaces': isArabic
            ? ['برج المملكة', 'البوليفارد', 'الدرعية التاريخية', 'حافة العالم', 'قصر المصمك', 'حديقة الملك عبد الله', 'سوق الزل']
            : ['Kingdom Tower', 'Boulevard', 'Historic Diriyah', 'Edge of the World', 'Masmak Fort', 'King Abdullah Park', 'Souq Al-Zal'],
        'activities': isArabic
            ? {
                'ترفيه': ['موسم الرياض', 'سينما', 'مدن ملاهي'],
                'مغامرة': ['رحلات بر', 'تطعيس', 'هايكنج جبل الفهرين'],
                'تسوق': ['الرياض بارك', 'النخيل مول', 'سنتريا مول'],
                'ثقافة': ['زيارة المتاحف', 'جولة في الدرعية']
              }
            : {
                'Entertainment': ['Riyadh Season', 'Cinema', 'Theme Parks'],
                'Adventure': ['Desert Trips', 'Dune Bashing', 'Edge of the World Hiking'],
                'Shopping': ['Riyadh Park', 'Nakheel Mall', 'Centria Mall'],
                'Culture': ['Museum Visits', 'Diriyah Tour']
              }
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
        'categories': ['luxury', 'family', 'adventure'],
        'gallery': [
          'https://i.pinimg.com/1200x/85/cb/65/85cb65a75d0980ae3373cf1b3262adbc.jpg',
          'https://imgs.search.brave.com/cqqsy07JP3O3PD6R6AkN3IaCU1uc8GXTJbX8LO01k54/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/aW10aWxhay5zYS9j/cm9wLzc5OC80Njkv/cG9zdHMvMTYzOGIy/MzM5N2JmNTI4ZjEx/MGFkYjk5YjNiNjI5/MDhCZFI3ODYud2Vi/cA',
          'https://imgs.search.brave.com/QOkyJ5ybU-qZtcwrdeSHbL2OaevErSyxqrMY7pI1MFw/rs:fit:860:0:0:0/g:ce/aHR0cDovL2Fzc2V0/cy5lbnV5Z3VuLmNv/bS9tZWRpYS9saWIv/NTcweDQwMC91cGxv/YWRzL2ltYWdlL2pl/ZGRhaC00NDU5My5q/cGVn',
          'https://imgs.search.brave.com/S-iloJRVQPEg9lj7248xhd05ixlTzrQecQfvwTydMp8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9kaWFy/bmEubmV0L3dwLWNv/bnRlbnQvdXBsb2Fk/cy8yMDI0LzEwLyVE/OCVBNyVEOCVCMyVE/OCVCOSVEOCVBNyVE/OCVCMS0lRDklODUl/RDglQUQlRDklODQl/RDglQTclRDglQUEt/JUQ5JTg1JUQ4JUFG/JUQ5JThBJUQ5JTg2/JUQ4JUE5LSVEOCVB/QyVEOCVBRiVEOCVB/OS0lRDglQTclRDkl/ODQlRDglQUElRDgl/QUMlRDglQTclRDgl/QjElRDklOEElRDgl/QTktJUQ4JUE3JUQ5/JTg0JUQ4JUI5JUQ4/JUE4JUQ5JTg4JUQ4/JUIxLndlYnA',
        ],
        'lat': 21.4858,
        'lng': 39.1925,
        'topPlaces': isArabic
            ? ['كورنيش جدة', 'البلد', 'نافورة الملك فهد', 'فقيه أكواريوم', 'رد سي مول', 'المسجد العائم', 'شاطئ السيف']
            : ['Jeddah Corniche', 'Al-Balad', 'King Fahd\'s Fountain', 'Fakieh Aquarium', 'Red Sea Mall', 'Floating Mosque', 'Al-Saif Beach'],
        'activities': isArabic
            ? {
                'بحر': ['غوص', 'رحلات بحرية', 'صيد سمك', 'جت سكي'],
                'ترفيه': ['ملاهي الشلال', 'مشاهدة النافورة'],
                'ثقافة': ['جولة في البلد', 'زيارة متاحف تاريخية']
              }
            : {
                'Sea': ['Diving', 'Sea Cruises', 'Fishing', 'Jet Ski'],
                'Entertainment': ['Al-Shallal Theme Park', 'Watch the Fountain'],
                'Culture': ['Al-Balad Tour', 'Historical Museum Visits']
              }
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
        'categories': ['family', 'nature', 'adventure'],
        'gallery': [
          'https://goldenhost.co/blog/wp-content/uploads/2025/03/%D8%BA%D8%BA%D9%81%D9%81%D8%B9%D9%81%D8%B9%D8%B9%D9%81%D8%B9%D9%81-1024x576.jpg',
          'https://imgs.search.brave.com/zQ8q7HYGTsMF6Riqd_ARcS9MnUGiVVpTAG82g18QV1U/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/YXJhYnNzdG9jay5j/b20vdXBsb2Fkcy9p/bWFnZXMvMTE0MDA4/L3RoZS16b28taW4t/Y2l0eS1vZi10aHVt/Ym5haWwtMTE0MDA4/LndlYnA',
          'https://imgs.search.brave.com/2LZhtSzQ26LknLpAiwUu0bxsorD-j0l6cfKqw3bK6pY/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly8yaW1n/Lm5ldC9oL2kxNTgu/cGhvdG9idWNrZXQu/Y29tL2FsYnVtcy90/OTgvbmlnd2FoYW0v/VHJhdmVsLzExNDQ5/LmpwZw',
          'https://imgs.search.brave.com/gSKe-ddrOKwTkWibzuH54mPFZL2HXmUunnmdJ9CeREg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/dXJ0cmlwcy5jb20v/d3AtY29udGVudC91/cGxvYWRzLzIwMTcv/MTEvQWxoYWRhLUNp/dHktUm9hZC5qcGc'
        ],
        'lat': 21.2851,
        'lng': 40.4251,
        'topPlaces': isArabic
            ? ['الهدا', 'الشفا', 'سوق عكاظ', 'حديقة الردف', 'قصر شبرا', 'تلفريك الهدا']
            : ['Al Hada', 'Ash Shafa', 'Souq Okaz', 'Ar Ruddaf Park', 'Shubra Palace', 'Taif Cable Car'],
        'activities': isArabic
            ? {
                'طبيعة': ['مزارع الورد', 'منتزهات جبلية'],
                'ترفيه': ['ركوب التلفريك', 'زيارة حديقة الحيوان'],
                'تاريخ': ['سوق عكاظ التاريخي']
              }
            : {
                'Nature': ['Rose Farms', 'Mountain Parks'],
                'Entertainment': ['Cable Car Ride', 'Visit Zoo'],
                'History': ['Historical Souq Okaz']
              }
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
        'categories': ['history', 'adventure', 'nature'],
        'gallery': [
          'https://media.gettyimages.com/id/1455349081/photo/saudi-arabia-najran-province-najran-aerial-view-of-historic-al-aan-palace.jpg?s=612x612&w=0&k=20&c=eMI1Rot-1OaGrsE1cuCfS_x4VySKOvu9Q_Fd5YzD0ow=',
          'https://imgs.search.brave.com/Y6qdVfgAWLDdWoApIrh66lVrxVaA7OVoY5J2KQdyRME/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/dXJ0cmlwcy5jb20v/d3AtY29udGVudC91/cGxvYWRzLzIwMTgv/MTAvVG91cmlzbS1p/bi1uYWpyYW4tMy5q/cGc',
          'https://imgs.search.brave.com/IywSQ7mlEXHJes2GIwe98snAw2FPWydXXzS3y-XY3Yc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/dXJ0cmlwcy5jb20v/d3AtY29udGVudC91/cGxvYWRzLzIwMjIv/MTIvR3VhdmEtR2Fy/ZGVuLU5hanJhbl8y/LmpwZw'
        ],
        'lat': 17.4933,
        'lng': 44.1277,
        'topPlaces': isArabic
            ? ['الأخدود الأثري', 'قصر الإمارة التاريخي', 'سد وادي نجران', 'منتزه الملك فهد', 'غابة سقام']
            : ['Archaeological Al-Ukhdood', 'Historical Emarah Palace', 'Najran Valley Dam', 'King Fahd Park', 'Saqam Forest'],
        'activities': isArabic
            ? {
                'تاريخ': ['مواقع أثرية', 'زيارة متاحف'],
                'طبيعة': ['نزهات في الغابات', 'زيارة السد'],
                'ثقافة': ['الأسواق الشعبية']
              }
            : {
                'History': ['Archaeological Sites', 'Museum Visits'],
                'Nature': ['Forest Picnics', 'Visit the Dam'],
                'Culture': ['Traditional Markets']
              }
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
        'categories': ['nature', 'adventure', 'family'],
        'gallery': [
          'https://saudipedia.com/var/site/storage/images/2/8/6/7/4347682-1-ara-SA/4eeb5ebd3b99-65618.jpg',
          'https://imgs.search.brave.com/kiW-DYfYfyE2C5X2lMAem3BhBtQGtb5CJvKS_LQjYS4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9ibG9n/Lndhc2FsdC5zYS93/cC1jb250ZW50L3Vw/bG9hZHMvMjAyMy8w/My8lRDklODUlRDgl/QUYlRDklOEElRDkl/ODYlRDglQTktJUQ4/JUFBJUQ4JUE4JUQ5/JTg4JUQ5JTgzLTc1/MHg0MjEuanBlZw',
          'https://imgs.search.brave.com/GWK5N2P5-2SiUDKbPX3jV98Ygm3kdsZZ71zewp0BcFw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zYXVk/aXBlZGlhLmNvbS92/YXIvc2l0ZS9zdG9y/YWdlL2ltYWdlcy8y/LzUvNy8wLzQzNDA3/NTItMS1hcmEtU0Ev/M2Q3ZjNhZmFmOTNj/LTY1NjIwLmpwZw',
          'https://imgs.search.brave.com/UHTRHndaRYCyNjz84xROsC7FaDEPhLDj-uujq8Oh9oA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/YWx3ZWIuY29tL3Ro/dW1icy9hcmFiY291/bnRyaWVzZ3VpZGUv/YXJ0aWNsZS9maXQ3/MTB4NTMyLyVEOSU4/MyVEOSU4NC0lRDkl/ODUlRDglQTctJUQ4/JUFBJUQ5JTg4JUQ4/JUFGLSVEOSU4NSVE/OCVCOSVEOCVCMSVE/OSU4MSVEOCVBQSVE/OSU4Ny0lRDglQjkl/RDklODYtJUQ5JTg1/JUQ4JUFGJUQ5JThB/JUQ5JTg2JUQ4JUE5/LSVEOCVBQSVEOCVB/OCVEOSU4OCVEOSU4/My5qcGc'
        ],
        'lat': 28.3835,
        'lng': 36.5662,
        'topPlaces': isArabic
            ? ['وادي الديسة', 'جبل اللوز', 'قلعة تبوك', 'متحف سكة الحديد', 'شاطئ قيال', 'عين السكر']
            : ['Wadi Al Disah', 'Jabal Al-Lawz', 'Tabuk Castle', 'Railway Museum', 'Qiyal Beach', 'Ain Al-Sukkar'],
        'activities': isArabic
            ? {
                'مغامرة': ['وديان', 'تخييم شتوي', 'هايكنج'],
                'بحر': ['سباحة', 'غوص في قيال'],
                'تاريخ': ['زيارة القلاع']
              }
            : {
                'Adventure': ['Valleys', 'Winter Camping', 'Hiking'],
                'Sea': ['Swimming', 'Diving in Qiyal'],
                'History': ['Castle Visits']
              }
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
        'categories': ['nature', 'adventure', 'family'],
        'gallery': [
          'https://saudipedia.com/var/site/storage/images/2/2/8/9/5539822-1-ara-SA/e918debaf9ba-65707.jpg',
          'https://imgs.search.brave.com/5bIDfGIzTlqtIYXLAGQ3iAS8wQLNn6MmTEyiQMm1LrY/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9yZXMu/Y2xvdWRpbmFyeS5j/b20vZGRqdWZ0Znky/L2ltYWdlL3VwbG9h/ZC9mX3dlYnAsY19m/aWxsLHFfYXV0by9t/ZW1waGlzL2xhcmdl/L2QwM2U5OWY1MTM1/ZTYzZjY0NWI3MjM4/Mjk5ODc5MTg5Lndl/YnA',
          'https://imgs.search.brave.com/briI-iDLDGmRrzFJXGMMym3ap-QCPYx6c--zWv2HptM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/YXJhYm5ld3MuY29t/L3NpdGVzL2RlZmF1/bHQvZmlsZXMvc3R5/bGVzL25fMzYwXzIx/Mi9wdWJsaWMvbWFp/bi1pbWFnZS8yMDIy/LzEwLzA2LzM0Nzg3/NzYtMTA5OTQzMTk2/LmpwZz9pdG9rPUds/YXA5d3Zf',
          'https://imgs.search.brave.com/iB-qnq_Ksp7FfPfxhAa_2baiI4LMrIAcT-CS3NZ7sgk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9ibG9n/LmJheXV0LnNhL3Vw/bG9hZHMvMjAyNS8x/MC9mdi5qcGc'
        ],
        'lat': 20.0129,
        'lng': 41.4677,
        'topPlaces': isArabic
            ? ['غابة رغدان', 'قرية ذي عين', 'منتزه القيم', 'غابة خيرة', 'سد الملح']
            : ['Raghadan Forest', 'Thee Ain Village', 'Al-Qaym Park', 'Khaira Forest', 'Al-Malad Dam'],
        'activities': isArabic
            ? {
                'طبيعة': ['غابات', 'نزهات جبلية', 'مشاهدة شلالات'],
                'ثقافة': ['زيارة قرى أثرية', 'أسواق شعبية']
              }
            : {
                'Nature': ['Forests', 'Mountain Picnics', 'Watch Waterfalls'],
                'Culture': ['Archaeological Village Visits', 'Traditional Markets']
              }
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
        'categories': ['family', 'adventure', 'nature'],
        'gallery': [
          'https://imgs.search.brave.com/DorlFb3ge3AyW55M6d8146QQy4L4midmisfemf1Wkfk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jbm4t/YXJhYmljLWltYWdl/cy5jbm4uaW8vY2xv/dWRpbmFyeS9pbWFn/ZS91cGxvYWQvd18x/OTIwLGNfc2NhbGUs/cV9hdXRvL2NubmFy/YWJpYy8yMDIxLzA1/LzA0L2ltYWdlcy8x/ODQxNDAuanBn',
          'https://imgs.search.brave.com/0OvJkYOmffso1QXLZ9GPQS9tUBm3CcBcFh267yEY_Fg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jbm4t/YXJhYmljLWltYWdl/cy5jbm4uaW8vY2xv/dWRpbmFyeS9pbWFn/ZS91cGxvYWQvd18x/OTIwLGNfc2NhbGUs/cV9hdXRvL2NubmFy/YWJpYy8yMDIxLzA1/LzA0L2ltYWdlcy8x/ODQxMjkuanBn',
          'https://imgs.search.brave.com/6uSQ_dg0xf1b2iX6CzLwQmrXZkZ4arPEwNgDqQS5_l4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/dXJ0cmlwcy5jb20v/d3AtY29udGVudC91/cGxvYWRzLzIwMTgv/MTAvVG91cmlzbS1p/bi1hYmhhLTEuanBn',
          'https://imgs.search.brave.com/-tF9Uo9phvzy7ox3U6mbl8f0dap8U8s2sU6kySTPWB8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zYXVk/aXBlZGlhLmNvbS92/YXIvc2l0ZS9zdG9y/YWdlL2ltYWdlcy8w/LzgvNi8wLzU1MTA2/ODAtMS1hcmEtU0Ev/NDdiNGQxNmViZWJk/LTY0Njc5LmpwZw'
        ],
        'lat': 18.2164,
        'lng': 42.5053,
        'topPlaces': isArabic
            ? ['السودة', 'رجال ألمع', 'الجبل الأخضر', 'حديقة أبو خيال', 'سد أبها', 'سوق الثلاثاء']
            : ['Al Souda', 'Rijal Almaa', 'Green Mountain', 'Abu Kheyal Park', 'Abha Dam', 'Tuesday Market'],
        'activities': isArabic
            ? {
                'مغامرة': ['تلفريك', 'باراجلايدنج', 'هايكنج في السودة'],
                'ثقافة': ['زيارة قرى تراثية', 'تسوق شعبي'],
                'ترفيه': ['منتزهات']
              }
            : {
                'Adventure': ['Teleferic', 'Paragliding', 'Al Souda Hiking'],
                'Culture': ['Heritage Village Visits', 'Local Shopping'],
                'Entertainment': ['Public Parks']
              }
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
        'categories': ['luxury', 'business', 'adventure'],
        'gallery': [
          'http://dealapp.sa/blog/wp-content/uploads/2023/05/%D9%85%D8%B4%D8%B1%D9%88%D8%B9-%D9%86%D9%8A%D9%88%D9%85.png',
          'https://imgs.search.brave.com/0BIHaHc3jI3ZNzn71LZUaH4nb3l9ywWFkp9Qs4rn6oc/rs:fit:860:0:0:0/g:ce/aHR0cDovL2RlYWxh/cHAuc2EvYmxvZy93/cC1jb250ZW50L3Vw/bG9hZHMvMjAyMy8w/NS8lRDglQTclRDkl/OEElRDklODYtJUQ5/JThBJUQ5JTgyJUQ4/JUI5LSVEOSU4NSVE/OCVCNCVEOCVCMSVE/OSU4OCVEOCVCOS0l/RDklODYlRDklOEEl/RDklODglRDklODUu/cG5n',
          'https://imgs.search.brave.com/ILjdpC0kZYjsVtujV4FKFN9IWaBuK43RRvhPrhbjDSY/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMjI1/MjYxMjM0Ny9waG90/by9veGFnb24tc21h/cnQtY2l0eS1lY29z/eXN0ZW0tcGFydC1v/Zi10aGUtbmVvbS1w/cm9qZWN0LWluLXNh/dWRpLWFyYWJpYS53/ZWJwP2E9MSZiPTEm/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9Zk9B/VnBUR2xfQ2x0eld5/YkRVVUVfOVBiUGNj/cmlLRmQ0cTliNEtz/ekFlTT0',
          'https://imgs.search.brave.com/XSyCx7pO3hYJMyACOQ_U3YzO6DIEFhQwvd4EfNQf0w0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/cGlmLmdvdi5zYS8t/L21lZGlhL3Byb2pl/Y3QvcGlmLWNvcnBv/cmF0ZS9waWYtY29y/cG9yYXRlLXNpdGUv/b3VyLWludmVzdG1l/bnRzL2dpZ2EtcHJv/amVjdHMvbmVvbS9u/ZW9tLWFib3V0LS5q/cGc_aD02NzUmaWFy/PTAmdz0xMjAw'
        ],
        'lat': 28.0000,
        'lng': 35.0000,
        'topPlaces': isArabic
            ? ['ذا لاين', 'أوكساجون', 'تروجينا', 'شاطئ قيال', 'سندالة']
            : ['The Line', 'Oxagon', 'Trojena', 'Qiyal Beach', 'Sindalah'],
        'activities': isArabic
            ? {
                'مستقبل': ['تجارب تقنية', 'جولات افتراضية'],
                'بحر': ['غوص فاخر', 'يخوت'],
                'مغامرة': ['تجارب جبلية']
              }
            : {
                'Future': ['Tech Experiences', 'Virtual Tours'],
                'Sea': ['Luxury Diving', 'Yachts'],
                'Adventure': ['Mountain Experiences']
              }
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
        'categories': ['family', 'luxury', 'business'],
        'gallery': [
          'http://dealapp.sa/blog/wp-content/uploads/2020/05/%D8%AC%D8%B2%D9%8ير%D8%A9-%D8%A7%D9%84%D9%85%D8%B1%D8%AC%D8%A7%D9%86-4.jpg',
          'https://imgs.search.brave.com/WHc2cvJk2QsOKSyTGbdlZ9UTmet3XISkQbjLj2HQMfU/rs:fit:860:0:0:0/g:ce/aHR0cDovL2RlYWxh/cHAuc2EvYmxvZy93/cC1jb250ZW50L3Vw/bG9hZHMvMjAyMy8w/NS8lRDglQUYlRDkl/ODQlRDklOEElRDkl/ODQtJUQ5JTg1JUQ4/JUFGJUQ5JThBJUQ5/JTg2JUQ4JUE5LSVE/OCVBNyVEOSU4NCVE/OCVBRiVEOSU4NSVE/OCVBNyVEOSU4NS0l/RDglQTglRDglQTcl/RDklODQlRDglQjUl/RDklODglRDglQjEu/cG5n',
          'https://imgs.search.brave.com/IFHcq-_4EDNSCZ3xh_GLywqtEvQTNsJZveoUYzZRvu8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9ibG9n/LmFqc3JwLmNvbS93/cC1jb250ZW50L3Vw/bG9hZHMvMjAyNC8x/MC8lRDklODUlRDgl/QUYlRDklOEElRDkl/ODYlRDglQTktJUQ4/JUE3JUQ5JTg0JUQ4/JUFGJUQ5JTg1JUQ4/JUE3JUQ5JTg1LTEw/MjR4NTg1LmpwZw',
          'https://imgs.search.brave.com/_ynP35caEUseQRL9nnmCL87RTBMcLJGXKjmTZJpKZj4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9ibG9n/LmFqc3JwLmNvbS93/cC1jb250ZW50L3Vw/bG9hZHMvMjAyNC8w/OC8lRDklODUlRDgl/QUYlRDklOEElRDkl/ODYlRDglQTktJUQ4/JUE3JUQ5JTg0JUQ4/JUFGJUQ5JTg1JUQ4/JUE3JUQ5JTg1LTY5/NngzOTguanBn'
        ],
        'lat': 26.4207,
        'lng': 50.0888,
        'topPlaces': isArabic
            ? ['كورنيش الخبر', 'جزيرة المرجان', 'قرية الألعاب', 'سايتك', 'شاطئ نصف القمر', 'مجمع الراشد']
            : ['Khobar Corniche', 'Marjan Island', 'Toy Town', 'Scitech', 'Half Moon Bay', 'Al-Rashid Mall'],
        'activities': isArabic
            ? {
                'بحر': ['سباحة', 'رحلات بحرية', 'جت سكي'],
                'ترفيه': ['زيارة سايتك', 'مدن ملاهي'],
                'تسوق': ['مولات الخبر والدمام']
              }
            : {
                'Sea': ['Swimming', 'Sea Cruises', 'Jet Ski'],
                'Entertainment': ['Visit Scitech', 'Theme Parks'],
                'Shopping': ['Khobar & Dammam Malls']
              }
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
        'categories': ['nature', 'adventure', 'family'],
        'gallery': [
          'https://saudipedia.com/var/site/storage/images/2/2/8/9/5539822-1-ara-SA/e918debaf9ba-65707.jpg',
          'https://imgs.search.brave.com/7q-BHXfQQenkuFF6AQQCZtocR736x9a5N4leXYBdhrU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTQ1/NTM2NzQzNi9waG90/by9zYXVkaS1hcmFi/aWEtamF6YW4tcHJv/dmluY2UtZmFpZmEt/YWVyaWFsLXZpZXct/b2YtcnVyYWwtc2V0/dGxlbWVudC1pbi1m/YWlmYS1tb3VudGFp/bnMuanBnP3M9NjEy/eDYxMiZ3PTAmaz0y/MCZjPU5CY1k1bHZv/ZGJQZlNXQ21KUll1/Zkg5VldoNkhWNEJD/bWkwQmptbC15ZFE9',
        ],
        'lat': 16.8892,
        'lng': 42.5511,
        'topPlaces': isArabic
            ? ['جزر فرسان', 'جبال فيفا', 'وادي لجب', 'القرية التراثية', 'شاطئ جازان']
            : ['Farasan Islands', 'Fayfa Mountains', 'Wadi Lajab', 'Heritage Village', 'Jazan Beach'],
        'activities': isArabic
            ? {
                'طبيعة': ['استوائية', 'هايكنج في فيفا', 'استكشاف وادي لجب'],
                'بحر': ['صيد', 'رحلات لفرسان']
              }
            : {
                'Nature': ['Tropical', 'Fayfa Hiking', 'Explore Wadi Lajab'],
                'Sea': ['Fishing', 'Trips to Farasan']
              }
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
        'categories': ['nature', 'adventure', 'family'],
        'gallery': [
          'https://imgs.search.brave.com/UOg6TpfBuwBiD5AKsipO5e94d9d-QUVgOkdN6I6Jhq0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTEy/OTg0NzE5OC9waG90/by9mYXJhc2FuLXNh/dWRpLWFyYWJpYS1l/bXB0eS1iZWFjaC13/aXRoLW1hbmdyb3Zl/LXJlZC1zZWEtZmFy/YXNhbi1zYXVkaS1h/cmFiaWEtb24tZGVj/ZW1iZXItMTcuanBn/P3M9NjEyeDYxMiZ3/PTAmaz0yMCZjPUF0/RXdINzFtWU8zd04y/ZGtfRS1UMmVndUVu/TmpjTURna255OEZj/V0tkMGs9',
          'https://imgs.search.brave.com/XCebM9fox_b3Y1uy8PT_OHc7P1MehNosXQyG44_3DK4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTI5/NjU0ODE4MC9waG90/by9yZWQtc2VhLWZh/cmFzYW4taXNsYW5k/LXNhdWRpLWFyYWJp/YS1taWRkbGUtZWFz/dC5qcGc_cz02MTJ4/NjEyJnc9MCZrPTIw/JmM9Q2N3c2tERjVH/cmtoSEdyM3l3SnBy/U0IySUQ3QkNfWmh1/X05xYTNpYWJTND0',
          'https://imgs.search.brave.com/6tkRyj49qniPQCyIAk8KJIalOoy3TbUb07hYAtXIlUc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly91bnVz/dWFsdHJhdmVsZXIu/Y29tL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDE5LzEwL0RKSV8w/NjE0LmpwZw',
        ],
        'lat': 16.7000,
        'lng': 42.1167,
        'topPlaces': isArabic
            ? ['الشواطئ البكر', 'بيت الجرمل', 'القلعة العثمانية', 'غابة القندل', 'شاطئ جنابة']
            : ['Pristine Beaches', 'Beit Al-Jarmal', 'Ottoman Fort', 'Qandal Forest', 'Janaba Beach'],
        'activities': isArabic
            ? {
                'بحر': ['غوص', 'مشاهدة الغزلان', 'صيد اللؤلؤ'],
                'طبيعة': ['جولة في غابات القندل']
              }
            : {
                'Sea': ['Diving', 'Gazelle Watching', 'Pearl Fishing'],
                'Nature': ['Qandal Forest Tour']
              }
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
        'categories': ['adventure', 'luxury', 'history'],
        'gallery': [
          'https://cms.factmagazines.com/wp-content/uploads/2024/03/Elephant-Rock-AlUla.jpeg',
          'https://imgs.search.brave.com/yuy-VfIKPTg7-05zh31lcZ_sVxth7Va7Tx6k92NNLXY/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9saDMu/Z29vZ2xldXNlcmNv/bnRlbnQuY29tL3Av/QUYxUWlwTU1sNldn/SkhMZnc0WmdYMkJr/bnJHeU1vSXBmRDh3/SXFsN2M4b1M9czY4/MC13NjgwLWg1MTA',
          'https://imgs.search.brave.com/EPR68WXDPUjMFzpNsiE43JqRjL40_vz_Zv17Zr8L_mI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9ibG9n/Z2VyLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS9pbWcvYi9SMjl2/WjJ4bC9BVnZYc0Vn/N0Q1Ty1Jb2RhWHFr/S19WRFlmR09NbDRw/V0ltazVWS1pNazZL/ZVJpTTEtYXZwYXBk/ZXJGbHAxMU9VNlRC/Ujk1RW9jWGFUeFZ0/eXk1SjhUUl83aENx/SFh6d0tGUTZGcFZU/S250dkwzMm1Rb25x/MG5rS21fTkI2aE10/VThoa3cxcjVjeVhN/VWNEb0szbmR6cDV5/WHh2OGkxeTd3NDF0/N2k5b19BWTlJQWM2/WVhRc00wa2hjejNQ/WVRCTzI3cDAvdzY0/MC1oMzQwLXJ3LzE1/MDA2NDcyNzMyNDc3/OTYwMDAuanBnLndl/YnA',
          'https://imgs.search.brave.com/snmk-v-JEptVi9LDJ7qvEWZiZBv2ZXet8NxvN4oMOUI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/YWwtYWluLmNvbS9s/Zy9pbWFnZXMvMjAx/OS8xLzEzLzEzMy0y/MTMwMTEtY2l0eS1v/bGEtdG91cmlzbS1r/c2EtMTcucG5n'
        ],
        'lat': 26.6200,
        'lng': 37.9231,
        'topPlaces': isArabic
            ? ['مدائن صالح', 'جبل الفيل', 'البلدة القديمة', 'مرايا', 'دادان', 'جبل عكمة']
            : ['Madain Salih', 'Elephant Rock', 'Old Town', 'Maraya', 'Dadan', 'Jabal Ikmah'],
        'activities': isArabic
            ? {
                'مغامرة': ['منطاد', 'تسلق الجبال', 'زيبلاين'],
                'تاريخ': ['جولات أثرية', 'مشاهدة النجوم'],
                'ثقافة': ['مهرجانات شتاء طنطورة']
              }
            : {
                'Adventure': ['Hot Air Balloon', 'Rock Climbing', 'Zipline'],
                'History': ['Archaeological Tours', 'Stargazing'],
                'Culture': ['Winter at Tantora Festival']
              }
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
        'categories': ['religious', 'history'],
        'gallery': [
          'https://imgs.search.brave.com/1HqcI-ZqcocK-9R1mKrm95mP3PBPAhh_1WEQJ0lkJu0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbmcu/cG5ndHJlZS5jb20v/dGh1bWJfYmFjay9m/aDI2MC9iYWNrZ3Jv/dW5kLzIwMjMwNTI3/L3BuZ3RyZWUtdGhl/LWxhcmdlLWlzbGFt/aWMtbW9zcXVlLWlu/LXRoZS1ob2x5LWNp/dHktb2YtbWVjY2Et/YXQtaW1hZ2VfMjY5/MjQ5Ni5qcGc',
          'https://imgs.search.brave.com/9wCOhY7ok-RAhrK225Qn3OsoRhLKnDDH3geIsFHz2VI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly92aXNp/dGluZ21ha2thaC5j/b20vX25leHQvaW1h/Z2U_dXJsPWh0dHBz/Oi8vcmVzLmNsb3Vk/aW5hcnkuY29tL2Rh/aW1ianpjbC9pbWFn/ZS91cGxvYWQvdjE3/NDk5ODgzNjIvcWVz/NHJxdnUzMjNtN3Jt/dmoyYzAuanBnJnc9/Mzg0MCZxPTc1',
          'https://imgs.search.brave.com/6jFsW074D9JkiMgDxz9xu99VNwNgWmztzy3-1SMUcDU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly92aXNp/dGluZ21ha2thaC5j/b20vX25leHQvaW1h/Z2U_dXJsPWh0dHBz/Oi8vcmVzLmNsb3Vk/aW5hcnkuY29tL2Rh/aW1ianpjbC9pbWFn/ZS91cGxvYWQvdjE3/NzUyMjM4NzgvYWUz/eWtnbmJkbnJ0ZDV0/bjBsMTcud2VicCZ3/PTM4NDAmcT03NQ',
          'https://imgs.search.brave.com/QdRtFJOw26kpmWW5ATcLyGj1Il8pYajz8pcflgl759I/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZi5i/c3RhdGljLmNvbS94/ZGF0YS9pbWFnZXMv/aG90ZWwvMjcweDIw/MC84OTY5NDQzMS53/ZWJwP2s9ODQwNDUz/MWUyYWM3NzQzMmUz/YjdkMmQ5Y2EyN2Rj/MzhiMTU2ZGZmOGM4/MTc2MDM5NDYyMTQw/MDkzYWUwZDJlYyZv/PQ'
        ],
        'lat': 21.3891,
        'lng': 39.8579,
        'topPlaces': isArabic
            ? ['المسجد الحرام', 'جبل النور', 'غار حراء', 'مزدلفة', 'جبل عرفات', 'ساعة مكة', 'بئر زمزم']
            : ['Grand Mosque', 'Jabal al-Nour', 'Hira Cave', 'Muzdalifah', 'Mount Arafat', 'Makkah Clock Tower', 'Zamzam Well'],
        'activities': isArabic
            ? {
                'ديني': ['عمرة', 'زيارة المشاعر المقدسة'],
                'تاريخ': ['متحف مكة للآثار', 'معرض عمارة الحرمين']
              }
            : {
                'Religious': ['Umrah', 'Visit Holy Sites'],
                'History': ['Makkah Archeology Museum', 'The Two Holy Mosques Exhibition']
              }
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
        'categories': ['religious', 'history'],
        'gallery': [
          'https://static.srpcdigital.com/styles/1037xauto/public/2014/04/01/1395849838834267800.jpg.webp',
          'https://imgs.search.brave.com/XNFcal5fsRj_DYcRnpbVmZDpW_S3ObI4IyRwPs8Jxi4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4y/LndpbmdpZS5jb20v/dXBsb2Fkcy9mX3dl/YnAsc18xOTIweDQz/MCxxXzUwLGZpdF9j/b3Zlci9zaHV0dGVy/c3RvY2tfMTE0ODUw/NjcyMV9lNTE5ZjM1/OGY0LmpwZw',
          'https://imgs.search.brave.com/GEvk6c59sP6TeTTLU86mcxv7UKBEp-cHf3M4bAv_UhM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/YXJhYnNzdG9jay5j/b20vdXBsb2Fkcy9p/bWFnZXMvMTI2NzUx/L2FuLWFuY2llbnQt/aGlzdG9yaWNhbC1k/ZWZlbnNpdmUtZm9y/dHJlc3MtdGh1bWJu/YWlsLTEyNjc1MS53/ZWJw',
          'https://imgs.search.brave.com/khlwDvVkQAsKhCQynB-yBTmwSfy7fCFeD-JSyYEMODI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS1jZG4udHJpcGFk/dmlzb3IuY29tL21l/ZGlhL3Bob3RvLW8v/MDcvYWUvOTEvNDMv/bW9zcXVlZS1kZS1x/dWJhLmpwZw'
        ],
        'lat': 24.4672,
        'lng': 39.6108,
        'topPlaces': isArabic
            ? ['المسجد النبوي', 'مسجد قباء', 'مقبرة البقيع', 'جبل أحد', 'مسجد القبلتين', 'متحف سكة حديد الحجاز']
            : ['Prophet\'s Mosque', 'Quba Mosque', 'Al-Baqi Cemetery', 'Mount Uhud', 'Qiblatain Mosque', 'Hejaz Railway Museum'],
        'activities': isArabic
            ? {
                'ديني': ['زيارة المسجد النبوي', 'الصلاة في قباء'],
                'تاريخ': ['زيارة موقع موقعة أحد', 'جولة في المتاحف الإسلامية']
              }
            : {
                'Religious': ['Visit Prophet\'s Mosque', 'Pray in Quba'],
                'History': ['Visit Uhud Site', 'Islamic Museum Tour']
              }
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
