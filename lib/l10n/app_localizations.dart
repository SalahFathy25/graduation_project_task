import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Saudi Travel Planner'**
  String get appTitle;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome,'**
  String get welcome;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Where do you want to go?'**
  String get searchHint;

  /// No description provided for @recommendedDestinations.
  ///
  /// In en, this message translates to:
  /// **'Recommended Destinations'**
  String get recommendedDestinations;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @myTrips.
  ///
  /// In en, this message translates to:
  /// **'My Trips'**
  String get myTrips;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @activeTrip.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Trip'**
  String get activeTrip;

  /// No description provided for @trip.
  ///
  /// In en, this message translates to:
  /// **'Trip'**
  String get trip;

  /// No description provided for @budget.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get budget;

  /// No description provided for @spent.
  ///
  /// In en, this message translates to:
  /// **'Spent'**
  String get spent;

  /// No description provided for @remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get remaining;

  /// No description provided for @createTrip.
  ///
  /// In en, this message translates to:
  /// **'Create New Trip'**
  String get createTrip;

  /// No description provided for @tripName.
  ///
  /// In en, this message translates to:
  /// **'Trip Name'**
  String get tripName;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDate;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @weather.
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get weather;

  /// No description provided for @aboutCity.
  ///
  /// In en, this message translates to:
  /// **'About City'**
  String get aboutCity;

  /// No description provided for @startPlanning.
  ///
  /// In en, this message translates to:
  /// **'Start Planning Now'**
  String get startPlanning;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get haveAccount;

  /// No description provided for @browseAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Browse as Guest'**
  String get browseAsGuest;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @travelerType.
  ///
  /// In en, this message translates to:
  /// **'Budget Class'**
  String get travelerType;

  /// No description provided for @travelPurpose.
  ///
  /// In en, this message translates to:
  /// **'Travel Purpose'**
  String get travelPurpose;

  /// No description provided for @economic.
  ///
  /// In en, this message translates to:
  /// **'Economic'**
  String get economic;

  /// No description provided for @moderate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get moderate;

  /// No description provided for @luxury.
  ///
  /// In en, this message translates to:
  /// **'Luxury'**
  String get luxury;

  /// No description provided for @adventure.
  ///
  /// In en, this message translates to:
  /// **'Adventure'**
  String get adventure;

  /// No description provided for @family.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get family;

  /// No description provided for @religious.
  ///
  /// In en, this message translates to:
  /// **'Religious'**
  String get religious;

  /// No description provided for @business.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get business;

  /// No description provided for @selectTravelPurpose.
  ///
  /// In en, this message translates to:
  /// **'Please select travel purpose'**
  String get selectTravelPurpose;

  /// No description provided for @cityRiyadh.
  ///
  /// In en, this message translates to:
  /// **'Riyadh'**
  String get cityRiyadh;

  /// No description provided for @cityJeddah.
  ///
  /// In en, this message translates to:
  /// **'Jeddah'**
  String get cityJeddah;

  /// No description provided for @cityAlUla.
  ///
  /// In en, this message translates to:
  /// **'AlUla'**
  String get cityAlUla;

  /// No description provided for @cityAbha.
  ///
  /// In en, this message translates to:
  /// **'Abha'**
  String get cityAbha;

  /// No description provided for @cityDammam.
  ///
  /// In en, this message translates to:
  /// **'Dammam'**
  String get cityDammam;

  /// No description provided for @cityTabuk.
  ///
  /// In en, this message translates to:
  /// **'Tabuk'**
  String get cityTabuk;

  /// No description provided for @cityMedina.
  ///
  /// In en, this message translates to:
  /// **'Medina'**
  String get cityMedina;

  /// No description provided for @cityMecca.
  ///
  /// In en, this message translates to:
  /// **'Mecca'**
  String get cityMecca;

  /// No description provided for @cityTaif.
  ///
  /// In en, this message translates to:
  /// **'Taif'**
  String get cityTaif;

  /// No description provided for @cityKhobar.
  ///
  /// In en, this message translates to:
  /// **'Khobar'**
  String get cityKhobar;

  /// No description provided for @cityHail.
  ///
  /// In en, this message translates to:
  /// **'Hail'**
  String get cityHail;

  /// No description provided for @cityFarasan.
  ///
  /// In en, this message translates to:
  /// **'Farasan Islands'**
  String get cityFarasan;

  /// No description provided for @cityNajran.
  ///
  /// In en, this message translates to:
  /// **'Najran'**
  String get cityNajran;

  /// No description provided for @cityBaha.
  ///
  /// In en, this message translates to:
  /// **'Al Baha'**
  String get cityBaha;

  /// No description provided for @cityNeom.
  ///
  /// In en, this message translates to:
  /// **'NEOM'**
  String get cityNeom;

  /// No description provided for @cityJazan.
  ///
  /// In en, this message translates to:
  /// **'Jazan'**
  String get cityJazan;

  /// No description provided for @riyadhDesc.
  ///
  /// In en, this message translates to:
  /// **'The capital and financial hub, known for its cultural diversity and global events.'**
  String get riyadhDesc;

  /// No description provided for @jeddahDesc.
  ///
  /// In en, this message translates to:
  /// **'The Bride of the Red Sea, a modern city blending ancient history with charming waterfronts.'**
  String get jeddahDesc;

  /// No description provided for @alUlaDesc.
  ///
  /// In en, this message translates to:
  /// **'An open museum featuring ancient civilizations\' ruins, Madain Salih, and green oases.'**
  String get alUlaDesc;

  /// No description provided for @abhaDesc.
  ///
  /// In en, this message translates to:
  /// **'The City of Fog, known for its cool weather, high mountains, and natural parks.'**
  String get abhaDesc;

  /// No description provided for @dammamDesc.
  ///
  /// In en, this message translates to:
  /// **'An eastern coastal city, featuring calm beaches and waterfronts.'**
  String get dammamDesc;

  /// No description provided for @tabukDesc.
  ///
  /// In en, this message translates to:
  /// **'Gateway to the North, known for its diverse terrain of mountains, valleys, and snowy areas.'**
  String get tabukDesc;

  /// No description provided for @medinaDesc.
  ///
  /// In en, this message translates to:
  /// **'The Enlightened City, a city of peace and home to the Prophet\'s Mosque.'**
  String get medinaDesc;

  /// No description provided for @meccaDesc.
  ///
  /// In en, this message translates to:
  /// **'The Holiest City, the Qibla of Muslims and home to the Grand Mosque and Kaaba.'**
  String get meccaDesc;

  /// No description provided for @taifDesc.
  ///
  /// In en, this message translates to:
  /// **'The Bride of Resorts, known for rose farms, moderate weather, and breathtaking mountains.'**
  String get taifDesc;

  /// No description provided for @khobarDesc.
  ///
  /// In en, this message translates to:
  /// **'A modern city in the Eastern Province, famous for its corniche and luxury malls.'**
  String get khobarDesc;

  /// No description provided for @hailDesc.
  ///
  /// In en, this message translates to:
  /// **'The Bride of the North, famous for its people\'s generosity and historic mountains.'**
  String get hailDesc;

  /// No description provided for @farasanDesc.
  ///
  /// In en, this message translates to:
  /// **'An archipelago of islands in the Red Sea, known for its pristine nature and coral reefs.'**
  String get farasanDesc;

  /// No description provided for @najranDesc.
  ///
  /// In en, this message translates to:
  /// **'An ancient historical city famous for the Al-Ukhdood ruins and unique mud villages.'**
  String get najranDesc;

  /// No description provided for @bahaDesc.
  ///
  /// In en, this message translates to:
  /// **'The Pearl of the Mountains, known for its dense forests, waterfalls, and archaeological villages.'**
  String get bahaDesc;

  /// No description provided for @neomDesc.
  ///
  /// In en, this message translates to:
  /// **'The City of the Future, combining advanced technology with pristine beaches and mountains.'**
  String get neomDesc;

  /// No description provided for @jazanDesc.
  ///
  /// In en, this message translates to:
  /// **'A coastal and mountainous city, the gateway to Farasan, known for its unique environmental diversity.'**
  String get jazanDesc;

  /// No description provided for @locationRiyadh.
  ///
  /// In en, this message translates to:
  /// **'Central Saudi Arabia (Capital)'**
  String get locationRiyadh;

  /// No description provided for @locationJeddah.
  ///
  /// In en, this message translates to:
  /// **'Western Saudi Arabia on the Red Sea'**
  String get locationJeddah;

  /// No description provided for @locationTaif.
  ///
  /// In en, this message translates to:
  /// **'Western Saudi Arabia near Mecca'**
  String get locationTaif;

  /// No description provided for @locationNajran.
  ///
  /// In en, this message translates to:
  /// **'Southern Saudi Arabia on the border with Yemen'**
  String get locationNajran;

  /// No description provided for @locationTabuk.
  ///
  /// In en, this message translates to:
  /// **'Northern Saudi Arabia'**
  String get locationTabuk;

  /// No description provided for @locationBaha.
  ///
  /// In en, this message translates to:
  /// **'Southwestern Saudi Arabia between Taif and Abha'**
  String get locationBaha;

  /// No description provided for @locationAbha.
  ///
  /// In en, this message translates to:
  /// **'Southwestern Saudi Arabia (Asir Region)'**
  String get locationAbha;

  /// No description provided for @locationNeom.
  ///
  /// In en, this message translates to:
  /// **'Northwestern Saudi Arabia (on the Red Sea)'**
  String get locationNeom;

  /// No description provided for @locationDammamKhobar.
  ///
  /// In en, this message translates to:
  /// **'Eastern Saudi Arabia on the Arabian Gulf'**
  String get locationDammamKhobar;

  /// No description provided for @locationJazan.
  ///
  /// In en, this message translates to:
  /// **'Southwestern Saudi Arabia'**
  String get locationJazan;

  /// No description provided for @locationFarasan.
  ///
  /// In en, this message translates to:
  /// **'Southwestern Saudi Arabia (near Jazan)'**
  String get locationFarasan;

  /// No description provided for @locationAlUla.
  ///
  /// In en, this message translates to:
  /// **'Northwestern Saudi Arabia'**
  String get locationAlUla;

  /// No description provided for @locationMecca.
  ///
  /// In en, this message translates to:
  /// **'Western Saudi Arabia'**
  String get locationMecca;

  /// No description provided for @locationMedina.
  ///
  /// In en, this message translates to:
  /// **'Western Saudi Arabia north of Mecca'**
  String get locationMedina;

  /// No description provided for @topPlaces.
  ///
  /// In en, this message translates to:
  /// **'Top Places'**
  String get topPlaces;

  /// No description provided for @activities.
  ///
  /// In en, this message translates to:
  /// **'Activities'**
  String get activities;

  /// No description provided for @placesToVisit.
  ///
  /// In en, this message translates to:
  /// **'Places to Visit'**
  String get placesToVisit;

  /// No description provided for @activitiesForYou.
  ///
  /// In en, this message translates to:
  /// **'Recommended Activities'**
  String get activitiesForYou;

  /// No description provided for @weatherToday.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Weather'**
  String get weatherToday;

  /// No description provided for @quickPlan.
  ///
  /// In en, this message translates to:
  /// **'Quick Plan'**
  String get quickPlan;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// No description provided for @generatePlan.
  ///
  /// In en, this message translates to:
  /// **'Generate Plan'**
  String get generatePlan;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter email'**
  String get enterEmail;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter password'**
  String get enterPassword;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordTooShort;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @enterFullName.
  ///
  /// In en, this message translates to:
  /// **'Please enter full name'**
  String get enterFullName;

  /// No description provided for @selectTravelerType.
  ///
  /// In en, this message translates to:
  /// **'Please select traveler type'**
  String get selectTravelerType;

  /// No description provided for @registerSuccess.
  ///
  /// In en, this message translates to:
  /// **'Account Created!'**
  String get registerSuccess;

  /// No description provided for @registerSuccessDesc.
  ///
  /// In en, this message translates to:
  /// **'Welcome! Your account is ready to use.'**
  String get registerSuccessDesc;

  /// No description provided for @noTripsYet.
  ///
  /// In en, this message translates to:
  /// **'No trips added yet'**
  String get noTripsYet;

  /// No description provided for @adventureStartsHere.
  ///
  /// In en, this message translates to:
  /// **'Your adventure starts here!'**
  String get adventureStartsHere;

  /// No description provided for @noTripsDesc.
  ///
  /// In en, this message translates to:
  /// **'It seems you haven\'t planned any trips yet. Explore cities and start organizing now.'**
  String get noTripsDesc;

  /// No description provided for @exploreDestinations.
  ///
  /// In en, this message translates to:
  /// **'Explore Destinations'**
  String get exploreDestinations;

  /// No description provided for @tripBudgetLabel.
  ///
  /// In en, this message translates to:
  /// **'Trip Budget'**
  String get tripBudgetLabel;

  /// No description provided for @riyal.
  ///
  /// In en, this message translates to:
  /// **'SAR'**
  String get riyal;

  /// No description provided for @weatherSunny.
  ///
  /// In en, this message translates to:
  /// **'Weather: Sunny'**
  String get weatherSunny;

  /// No description provided for @discover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get discover;

  /// No description provided for @manageTripBudget.
  ///
  /// In en, this message translates to:
  /// **'Manage Trip Budget'**
  String get manageTripBudget;

  /// No description provided for @totalBudget.
  ///
  /// In en, this message translates to:
  /// **'Total Budget'**
  String get totalBudget;

  /// No description provided for @estimatedBudget.
  ///
  /// In en, this message translates to:
  /// **'Estimated Budget'**
  String get estimatedBudget;

  /// No description provided for @budgetHint.
  ///
  /// In en, this message translates to:
  /// **'Enter amount in SAR'**
  String get budgetHint;

  /// No description provided for @fillAllFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill all required fields'**
  String get fillAllFields;

  /// No description provided for @tripCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Trip created successfully'**
  String get tripCreatedSuccess;

  /// No description provided for @createTripDesc.
  ///
  /// In en, this message translates to:
  /// **'Please complete all information to create a comprehensive trip plan.'**
  String get createTripDesc;

  /// No description provided for @tripNameHint.
  ///
  /// In en, this message translates to:
  /// **'Ex: Riyadh Exploration Trip'**
  String get tripNameHint;

  /// No description provided for @selectCity.
  ///
  /// In en, this message translates to:
  /// **'Select City'**
  String get selectCity;

  /// No description provided for @addActivity.
  ///
  /// In en, this message translates to:
  /// **'Add New Activity'**
  String get addActivity;

  /// No description provided for @dayNumber.
  ///
  /// In en, this message translates to:
  /// **'Day Number'**
  String get dayNumber;

  /// No description provided for @dayNumberHint.
  ///
  /// In en, this message translates to:
  /// **'Ex: 1'**
  String get dayNumberHint;

  /// No description provided for @activityTitle.
  ///
  /// In en, this message translates to:
  /// **'Activity Title'**
  String get activityTitle;

  /// No description provided for @activityTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Activity description'**
  String get activityTitleHint;

  /// No description provided for @startTime.
  ///
  /// In en, this message translates to:
  /// **'Start Time'**
  String get startTime;

  /// No description provided for @endTime.
  ///
  /// In en, this message translates to:
  /// **'End Time'**
  String get endTime;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @notesHint.
  ///
  /// In en, this message translates to:
  /// **'Add any additional notes'**
  String get notesHint;

  /// No description provided for @saveActivity.
  ///
  /// In en, this message translates to:
  /// **'Save Activity'**
  String get saveActivity;

  /// No description provided for @bookingIn.
  ///
  /// In en, this message translates to:
  /// **'Booking in'**
  String get bookingIn;

  /// No description provided for @whatToBook.
  ///
  /// In en, this message translates to:
  /// **'What do you want to book?'**
  String get whatToBook;

  /// No description provided for @hotel.
  ///
  /// In en, this message translates to:
  /// **'Hotel'**
  String get hotel;

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// No description provided for @restaurant.
  ///
  /// In en, this message translates to:
  /// **'Restaurant'**
  String get restaurant;

  /// No description provided for @checkInDate.
  ///
  /// In en, this message translates to:
  /// **'Booking / Check-in Date'**
  String get checkInDate;

  /// No description provided for @checkOutDate.
  ///
  /// In en, this message translates to:
  /// **'Check-out Date'**
  String get checkOutDate;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// No description provided for @confirmBooking.
  ///
  /// In en, this message translates to:
  /// **'Confirm Preliminary Booking'**
  String get confirmBooking;

  /// No description provided for @bookingSuccess.
  ///
  /// In en, this message translates to:
  /// **'Booking request sent successfully'**
  String get bookingSuccess;

  /// No description provided for @tripDetails.
  ///
  /// In en, this message translates to:
  /// **'Trip Details'**
  String get tripDetails;

  /// No description provided for @manageBudget.
  ///
  /// In en, this message translates to:
  /// **'Manage Budget'**
  String get manageBudget;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @editBudget.
  ///
  /// In en, this message translates to:
  /// **'Edit Budget'**
  String get editBudget;

  /// No description provided for @dailyItinerary.
  ///
  /// In en, this message translates to:
  /// **'Daily Itinerary'**
  String get dailyItinerary;

  /// No description provided for @lastActivity.
  ///
  /// In en, this message translates to:
  /// **'Last Activity'**
  String get lastActivity;

  /// No description provided for @noActivitiesYet.
  ///
  /// In en, this message translates to:
  /// **'No activities added yet'**
  String get noActivitiesYet;

  /// No description provided for @viewFullItinerary.
  ///
  /// In en, this message translates to:
  /// **'View Full Itinerary'**
  String get viewFullItinerary;

  /// No description provided for @tripItinerary.
  ///
  /// In en, this message translates to:
  /// **'Trip Itinerary'**
  String get tripItinerary;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// No description provided for @endsAt.
  ///
  /// In en, this message translates to:
  /// **'Ends at'**
  String get endsAt;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
