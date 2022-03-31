import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poorvaholiday/constant/color_constant.dart';
import 'package:poorvaholiday/screen/widgets/custom_text.dart';

import 'footer/footer.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  value: 'Privacy Policy - Poorva Holidays',
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 8),
              TextView(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  value:
                      'Introduction: Poorva Holidays (India) Private Limited (hereinafter “PH”) recognizes the importance of privacy of its users and also of maintaining confidentiality of the information provided by its users as a responsible data controller and data processor./nThis Privacy Policy provides for the practices for handling and securing users Personal Information (defined hereunder) by PH and its subsidiaries and affiliates./nThis Privacy Policy is applicable to any person (User) who purchase, intend to purchase, or inquire about any product(s) or service(s) made available by PH through any of PH’s customer interface channels including its website, mobile site, mobile app & offline channels including call centers and offices (collectively referred herein as "Sales Channels")./nFor the purpose of this Privacy Policy, wherever the context so requires "you" or "your" shall mean User and the term "we", "us", "our" shall mean PH. For the purpose of this Privacy Policy, Website means the website(s), mobile site(s) and mobile app(s)./nBy using or accessing the Website or other Sales Channels, the User hereby agrees with the terms of this Privacy Policy and the contents herein. If you disagree with this Privacy Policy please do not use or access our Website or other Sales Channels./nThis Privacy Policy does not apply to any website(s), mobile sites and mobile apps of third parties, even if their websites/products are linked to our Website. User should take note that information and privacy practices of PH’s business partners, advertisers, sponsors or other sites to which PH provides hyperlink(s), may be materially different from this Privacy Policy. Accordingly, it is recommended that you review the privacy statements and policies of any such third parties with whom they interact./nThis Privacy Policy is an integral part of your User Agreement with PH and all capitalized terms used, but not otherwise defined herein, shall have the respective meanings as ascribed to them in the User Agreement.',
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 20),
              TextView(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  value: 'USERS OUTSIDE THE GEOGRAPHICAL LIMITS OF INDIA',
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 8),
              TextView(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  value:
                      "Please note that the data shared with PH shall be primarily processed in India and such other jurisdictions where a third party engaged by PH may process the data on PH’s behalf. By agreeing to this policy, you are providing PH with your explicit consent to process your personal information for the purpose(s) defined in this policy. The data protection regulations in India or such other jurisdictions mentioned above may differ from those of your country of residence.If you have any concerns in the processing your data and wish to withdraw your consent, you may do so by writing to the following email id: privacy@go-PH.com. However, if such processing of data is essential for us to be able to provide service to you, then we may not be able to serve or confirm your bookings after your withdrawal of consent. For instance, if you want to book any international holiday package in fixed departures (group bookings), then certain personal information of yours like contact details, gender, dietary preferences, choice of room with smoking facility, any medical condition which may require specific attention or facility etc. may have to be shared by us with our vendors in each city where you will stay, and they may further process this information for making suitable arrangements for you during the holiday. Such sharing and processing of information may extend to the hotel where you will stay or the tour manager who will be your guide during the travel.A withdrawal of consent by you for us to process your information may:severely inhibit our ability to serve you properly and in such case, we may have to refuse the booking altogether, or unreasonably restrict us to service your booking (if a booking is already made) which may further affect your trip or may compel us to cancel your booking.",
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 20),
              TextView(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  value: 'TYPE OF INFORMATION WE COLLECT AND ITS LEGAL BASIS',
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 8),
              TextView(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  value:
                  "The information as detailed below is collected for us to be able to provide the services chosen by you and also to fulfill our legal obligations as well as our obligations towards third parties as per our User Agreement.\n\nPersonal Information of User shall include the information shared by the User and collected by us for the following purposes:\nRegistration on the Website: Information which you provide while subscribing to or registering on the Website, including but not limited to information about your personal identity such as name, gender, marital status, religion, age, profile picture etc., your contact details such as your email address, postal addresses, frequent flyer number, telephone (mobile or otherwise) and/or fax numbers. The information may also include information such as your banking details (including credit/debit card) and any other information relating to your income and/or lifestyle; billing information payment history etc. (as shared by you).\n\nOther information: We many also collect some other information and documents including but not limited to:\nTransactional history (other than banking details) about your e-commerce activities, buying behavior.\nYour usernames, passwords, email addresses and other security-related information used by you in relation to our Services.\nData either created by you or by a third party and which you wish to store on our servers such as image files, documents etc.\nData available in public domain or received from any third party including social media channels, including but not limited to personal or non-personal information from your linked social media channels (like name, email address, friend list, profile pictures or any other information that is permitted to be received as per your account settings) as a part of your account information.\n\nInformation pertaining any other traveler(s) for who you make a booking through your registered PH account. In such case, you must confirm and represent that each of the other traveler(s) for whom a booking has been made, has agreed to have the information shared by you disclosed to us and further be shared by us with the concerned service provider(s).\n\nIf you request PH to provide visa related services, then copies of your passport, bank statements, originals of the filled in application forms, photographs, and any other information which may be required by the respective embassy to process your visa application.\n\nFor international bookings, Users, in compliance with the Liberalized Remittance Scheme(LRS) of RBI or any other law may be required to provide details such as their PAN information or passport details number or any such information required by Service Provider. Such information shall be strictly used as per the aforesaid requirements only. In case a User does not wish to provide this information, PH may not be able to process the booking. PH will never share User’s PAN details without their prior consent unless otherwise such action is required by any law enforcement authority for investigation, by court order or in reference to any legal process.\n\nIn case you opt for contactless check-in at Hotels, then copies of your government identification like aadhar, driving license, election card etc., Self-declaration and any other information like date of birth, destination/origin of travel and place of residence that may be required by the concerned Hotel to honor your hotel booking.\n\nFor international bookings, Users, in compliance with the Liberalized Remittance Scheme(LRS) of RBI or any other law may be required to provide details such as their PAN information or passport details number or any such information required by Service Provider.\n\nIn case you opt for contactless check-in at Hotels, then copies of your government identification like aadhar, driving license, election card etc., Self-declaration and any other information like date of birth, destination/origin of travel and place of residence that may be required by the concerned Hotel to honor your hotel booking.\n\nYour Covid-19 Vaccination status and certificate in case you wish to avail any service for provision of which such Covid-19 vaccination related information is required or want to access your vaccination certificate at a later stage for travel related or any other purpose. PH will never process the beneficiary id and other id details contained in the vaccination certificate.\n\nSuch information shall be strictly used for the aforesaid specified & lawful purpose only. User further understands that PH may share this information with the end service provider or any other third party for provision and facilitation of the desired booking. PH will always redact all/any sensitive & confidential information contained in the vaccination certificate, passbook, bank statement or any other identity card submitted for the purpose of availing a service, promotional offer or booking a product on the Website. In case a User does not wish to provide this information or opts for deletion of the information already provided, PH may not be able to process the desired booking request. PH will never share any of the above information collected including PAN card details, Vaccination status & certificate , Passport details , Aadhar Card details without their prior consent unless otherwise such action is required by any law enforcement authority for investigation, by court order or in reference to any legal process.",
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 20),
              TextView(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  value: 'HOW WE USE YOUR PERSONAL INFORMATION:',
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 8),
              TextView(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  value:
                  "The Personal Information collected maybe used in the following manner:\nWhile making a booking\nWhile making a booking, we may use Personal Information including, payment details which include cardholder name, credit/debit card number (in encrypted form) with expiration date, banking details, wallet details etc. as shared and allowed to be stored by you. We may also use the information of travelers list as available in or linked with your account. This information is presented to the User at the time of making a booking to enable you to complete your bookings expeditiously.\n\nWe may also use your Personal Information for several reasons including but not limited to confirm your reservations with respective service providers;\nkeep you informed of the transaction status;send booking confirmations either via sms or Whatsapp or any other messaging service;send any updates or changes to your booking(s);allow our customer service to contact you, if necessary;customize the content of our website, mobile site and mobile app;request for reviews of products or services or any other improvements;send verification message(s) or email(s);validate/authenticate your account and to prevent any misuse or abuse.contact you on your birthday/anniversary to offer a special gift or offer.\n\nSurveys:\nWe value opinions and comments from our Users and frequently conduct surveys, both online and offline. Participation in these surveys is entirely optional. Typically, the information received is aggregated, and used to make improvements to Website, other Sales Channels, services and to develop appealing content, features and promotions for members based on the results of the surveys. Identity of the survey participants is anonymous unless otherwise stated in the survey.\nMarketing Promotions, Research and Programs:\nMarketing promotions, research and programs help us to identify your preferences, develop programs and improve user experience. PH frequently sponsors promotions to give its Users the opportunity to win great travel and travel related prizes. Personal Information collected by us for such activities may include contact information and survey questions. We use such Personal Information to notify contest winners and survey information to develop promotions and product improvements. As a registered User, you will also occasionally receive updates from us about fare sales in your area, special offers, new PH services, other noteworthy items (like savings and benefits on airfares, hotel reservations, holiday packages, car rentals and other travel services) and marketing programs.\nIn addition, you may look forward to receiving periodic marketing emails, newsletters and exclusive promotions offering special deals.\nFrom time to time we may add or enhance services available on the Website. To the extent these services are provided, and used by you, we will use the Personal Information you provide to facilitate the service(s) requested. For example, if you email us with a question, we will use your email address, name, nature of the question, etc. to respond to your question. We may also store such Personal Information to assist us in making the Website the better and easier to use for our Users.\n\nPH may from time to time launch reward programs by way of which users may stand to win travel related rewards or other rewards. We may use your Personal Information to enroll you in the rewards program and status of the same will be visible each time you log in to the Website. Depending on the reward program, each time you win a reward, PH may share your Personal Information with a third party that will be responsible for fulfilling the reward to you. You may however choose to opt out of such reward programs by writing to us. For various purposes such as fraud detection, offering bookings on credit etc., we at times may verify information of customers on selective basis, including their credit information. Additionally, PH may share your Personal Information, anonymized and/ or aggregated data to a third party that PH may engage to perform certain tasks on its behalf, including but not limited to payment processing, data hosting, data processing and assessing credit worthiness for offering bookings on credit.",
                  customColor: ColorConstant.blueColor),

              const SizedBox(height: 20),
              TextView(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  value: 'HOW LONG DO WE KEEP YOUR PERSONAL INFORMATION?',
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 8),
              TextView(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  value:
                  """PH will retain your Personal Information on its servers for as long as is reasonably necessary for the purposes listed in this policy. In some circumstances we may retain your Personal Information for longer periods of time, for instance where we are required to do so in accordance with any legal, regulatory, tax or accounting requirements.
                     Where your personal data is no longer required we will ensure it is either securely deleted or stored in a way which means it will no longer be used by the business.""",
                  customColor: ColorConstant.blueColor),

              const SizedBox(height: 20),
              TextView(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  value: 'COOKIES AND SESSION DATA',
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 8),
              TextView(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  value:
                  "Cookies:\nPH uses cookies to personalize your experience on the Website and the advertisements that maybe displayed. PH’s use of cookies is similar to that of any other reputable online companies.Cookies are small pieces of information that are stored by your browser on your device's hard drive. Cookies allow us to serve you better and more efficiently. Cookies also allow ease of access, by logging you in without having to type your login name each time (only your password is needed); we may also use such cookies to display any advertisement(s) to you while you are on the Website or to send you offers (or similar emails – provided you have not opted out of receiving such emails) focusing on destinations which may be of your interest.A cookie may also be placed by our advertising servers, or third party advertising companies. Such cookies are used for purposes of tracking the effectiveness of advertising served by us on any website, and also to use aggregated statistics about your visits to the Website in order to provide advertisements in the Website or any other website about services that may be of potential interest to you. The third party advertising companies or advertisement providers may also employ technology that is used to measure the effectiveness of the advertisements. All such information is anonymous. This anonymous information is collected through the use of a pixel tag, which is an industry standard technology and is used by all major websites. They may use this anonymous information about your visits to the Website in order to provide advertisements about goods and services of potential interest to you. No Personal Information is collected during this process. The information so collected during this process, is anonymous, and does not link online actions to a UserMost web browsers automatically accept cookies. Of course, by changing the options on your web browser or using certain software programs, you can control how and whether cookies will be accepted by your browser. PH supports your right to block any unwanted Internet activity, especially that of unscrupulous websites. However, blocking PH cookies may disable certain features on the Website, and may hinder an otherwise seamless experience to purchase or use certain services available on the Website. Please note that it is possible to block cookie activity from certain websites while permitting cookies from websites you trust.\nAutomatic Logging of Session Data:Each time you access the Website your session data gets logged. Session data may consist of various aspects like the IP address, operating system and type of browser software being used and the activities conducted by the User while on the Website. We collect session data because it helps us analyze User’s choices, browsing pattern including the frequency of visits and duration for which a User is logged on. It also helps us diagnose problems with our servers and lets us better administer our systems. The aforesaid information cannot identify any User personally. However, it may be possible to determine a User's Internet Service Provider (ISP), and the approximate geographic location of User's point of connectivity through the above session data.",
                  customColor: ColorConstant.blueColor),


              const SizedBox(height: 20),
              TextView(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  value: 'WITH WHOM YOUR PERSONAL INFORMATION IS SHARED',
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 8),
              TextView(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  value:
                  "Service Providers and suppliers:\nYour information shall be shared with the end service providers like airlines, hotels, bus service providers, cab rental, railways or any other suppliers who are responsible for fulfilling your booking. You may note that while making a booking with PH you authorize us to share your information with the said service providers and suppliers. It is pertinent to note that PH does not authorize the end service provider to use your information for any other purpose(s) except as may be for fulfilling their part of service. However, how the said service providers/suppliers use the information shared with them is beyond the purview and control of PH as they process Personal Information as independent data controllers, and hence we cannot be made accountable for the same. You are therefore advised to review the privacy policies of the respective service provider or supplier whose services you choose to avail.\nPH does not sell or rent individual customer names or other Personal Information of Users to third parties except sharing of such information with our business / alliance partners or vendors who are engaged by us for providing various referral services and for sharing promotional and other benefits to our customers from time to time basis their booking history with us.\n\nCOMPANIES IN THE SAME GROUP:\nIn the interests of improving personalization and service efficiency, we may, under controlled and secure circumstances, share your Personal Information with our affiliate or associate entities. This will enable us to provide you with information about various products and services, both leisure- and travel-related, which might interest you; or help us address your questions and requests in relation to your bookings.If the assets of PH are acquired, our customer information may also be transferred to the acquirer depending upon the nature of such acquisition. In addition, as part of business expansion/development/restructuring or for any other reason whatsoever, if we decide to sell/transfer/assign our business, any part thereof, any of our subsidiaries or any business units, then as part of such restructuring exercise customer information including the Personal Information collected herein shall be transferred accordingly.\n\nBUSINESS PARTNERS and THIRD-PARTY VENDORS:\nWe may also share certain filtered Personal Information to our corporate affiliates or business partners who may contact the customers to offer certain products or services, which may include free or paid products / services, which will enable the customer to have better travel experience or to avail certain benefits specially made for PH customers. Examples of such partners are entities offering co-branded credit cards, travel insurance, insurance cover against loss of wallet, banking cards or similar sensitive information etc. If you choose to avail any such services offered by our business partners, the services so availed will be governed by the privacy policy of the respective service provider.PH may share your Personal Information to third party that PH may engage to perform certain tasks on its behalf, including but not limited to payment processing, data hosting, and data processing platforms.We use non-identifiable Personal Information of Users in aggregate or anonymized form to build higher quality, more useful online services by performing statistical analysis of the collective characteristics and behavior of our customers and visitors, and by measuring demographics and interests regarding specific areas of the Website. We may provide anonymous statistical information based on this data to suppliers, advertisers, affiliates and other current and potential business partners. We may also use such aggregate data to inform these third parties as to the number of people who have seen and clicked on links to their websites. Any Personal Information which we collect and which we may use in an aggregated format is our property. We may use it, in our sole discretion and without any compensation to you, for any legitimate purpose including without limitation the commercial sale thereof to third parties.Occasionally, PH will hire a third party for market research, surveys etc. and will provide information to these third parties specifically for use in connection with these projects. The information (including aggregate cookie and tracking information) we provide to such third parties, alliance partners, or vendors are protected by confidentiality agreements and such information is to be used solely for completing the specific project, and in compliance with the applicable regulations.\n\nDISCLOSURE OF INFORMATION\nIn addition to the circumstances described above, PH may disclose User's Personal Information if required to do so: by law, required by any enforcement authority for investigation, by court order or in reference to any legal process; to conduct our business; for regulatory, internal compliance and audit exercise(s)to secure our systems; or to enforce or protect our rights or properties of PH or any or all of its affiliates, associates, employees, directors or officers or when we have reason to believe that disclosing Personal Information of User(s) is necessary to identify, contact or bring legal action against someone who may be causing interference with our rights or properties, whether intentionally or otherwise, or when anyone else could be harmed by such activities.Such disclosure and storage may take place without your knowledge. In that case, we shall not be liable to you or any third party for any damages howsoever arising from such disclosure and storage.",
                  customColor: ColorConstant.blueColor),



              const SizedBox(height: 20),
              TextView(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  value: 'USER GENERATED CONTENT',
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 8),
              TextView(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  value:
                  "PH provides an option to its users to post their experiences by way of reviews, ratings and general poll questions. The customers also have an option of posting questions w.r.t a service offered by PH or post answers to questions raised by other users. PH may also hire a third party to contact you and gather feedback about your recent booking with PH. Though the participation in the feedback process is purely optional, you may still receive emails, notifications (app, sms, Whatsapp or any other messaging service) for you to share your review(s), answer questions posted by other users or a. The reviews may be written or in a video format. The reviews written or posted may also be visible on other travel or travel related platforms.The UGC that PH collects may be of the following kinds:\nReview and Ratings\nQuestion and Answers\nCrowd Source Data Collection (poll questions).\nEach User who posts review or ratings, Q&A, photographs shall have a profile, which other Users will be able to access. Other Users may be able to view the number of trips, reviews written, questions asked and answered and photographs posted.",
                  customColor: ColorConstant.blueColor),


              const SizedBox(height: 20),
              TextView(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  value: 'HOW CAN YOU OPT-OUT OF RECEIVING OUR PROMOTIONAL E-MAILS?',
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 8),
              TextView(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  value:
                  "You will occasionally receive e-mail updates from us about fare sales in your area, special offers, new PH services, and other noteworthy items. We hope you will find these updates interesting and informative. If you wish not to receive them, please click on the unsubscribe link or follow the instructions in each e-mail message.",
                  customColor: ColorConstant.blueColor),


              const SizedBox(height: 20),
              TextView(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  value: 'PERMISSIONS REQUIRED FOR USING OUR MOBILE APPLICATIONS',
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 8),
              TextView(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  value:
                  "When the PH app is installed on your phone or tablet, a list of permissions appear and are needed for the app to function effectively. There is no option to customize the list. The permissions that PH requires and the data that shall be accessed and its use is as below:\n\n\nAndroid permissions:\n\nDevice & App history: We need your device permission to get information about your device, like OS (operating system) name, OS version, mobile network, hardware model, unique device identifier, preferred language, etc. Basis these inputs, we intend to optimize your travel booking experience, use OS specific capabilities to drive great in-funnel experiences using components of device’s OS, etc.\n\nIdentity: This permission enables us to know about details of your account(s) on your mobile device. We use this info to auto-fill your email ID’s and provide a typing free in-funnel experience. It helps us map email ID’s to a particular user to give you the benefit of exclusive travel offers, wallet cash-backs, etc. It also allows facilitating your Facebook and Google+ login.\n\nLocation: This permission enables us to give you the benefit of location specific deals and provide you a personalized in-funnel experience. When you launch Poorva Holidays app to make a travel booking, we auto-detect your location so that your nearest airport or city is auto-filled. We also require this permission to recommend you nearest hotels in case you are running late and want to make a quick last minute booking for the nearest hotel. Your options are personalized basis your locations. For international travel, this enables us to determine your time zone and provide information accordingly\n\nSMS: If you allow us to access your SMS, we read your SMS to autofill or prepopulate ‘OTP’ while making a transaction and to validate your mobile number. This provides you a seamless purchase experience while making a booking and you don’t need to move out of the app to read the SMS and then enter it in the app.\n\nPhone: The app requires access to make phone calls so that you can make phone calls to hotels, airlines and our customer contact centers directly through the app.\n\nContacts: If you allow us to access your contacts, it enables us to provide a lot of social features to you such as sharing your hotel/ flight/ holidays with your friends, inviting your friends to try our app, send across referral links to your friends, etc. We may also use this information to make recommendations for hotels where your friends have stayed. This information will be stored on our servers and synced from your phone.\n\nPhoto/ Media/ Files: The libraries in the app use these permissions to allow map data to be saved to your phone's external storage, like SD cards. By saving map data locally, your phone doesn't need to re-download the same map data every time you use the app. This provides you a seamless Map based Hotel selection experience, even on low bandwidth network.\n\nWi-Fi connection information: When you allow us the permission to detect your Wi-Fi connection, we optimize your experience such as more detailing on maps, better image loading, more hotel/ flights/ package options to choose from, etc.\n\nDevice ID & Call information: This permission is used to detect your Android ID through which we can uniquely identify users. It also lets us know your contact details using which we pre-populate specific fields to ensure a seamless booking experience.\n\nCalendar: This permission enables us to put your travel plan on your calendar.\n\nIOS Permissions:\nNotifications: If you opt in for notifications, it enables us to send across exclusive deals, promotional offers, travel related updates, etc. on your device. If you do not opt for this, updates for your travel like PNR status, booking confirmation, refund (in case of cancellation), etc. will be sent through SMS.\nContacts: If you opt in for contacts permission, it enables us to provide a lot of social features to you such as sharing your hotel/ flight/ holidays with your friends, inviting your friends to try our app, send across referral links to your friends, etc. We will also use this information to make recommendations for hotels where your friends have stayed. This information will be stored on our servers and synced from your phone.\nLocation: This permission enables us to give you the benefit of location specific deals and provide you a personalized in-funnel experience. When you launch our app to make a travel booking, we auto-detect your location so that your nearest Airport or City is auto-filled. We require this permission to recommend your nearest hotels in case you are running late and want to make a quick last minute booking for the nearest hotel. Your options are personalized basis your locations. For international travel, this enables us to determine your time zone and provide information accordingly.",
                  customColor: ColorConstant.blueColor),


              const SizedBox(height: 20),
              TextView(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  value: 'HOW WE PROTECT YOUR PERSONAL INFORMATION?',
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 8),
              TextView(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  value:
                  "All payments on the Website are secured. This means all Personal Information you provide is transmitted using TLS (Transport Layer Security) encryption. TSL is a proven coding system that lets your browser automatically encrypt, or scramble, data before you send it to us. Website has stringent security measures in place to protect the loss, misuse, and alteration of the information under our control. Whenever you change or access your account information, we offer the use of a secure server. Once your information is in our possession we adhere to strict security guidelines, protecting it against unauthorized access.",
                  customColor: ColorConstant.blueColor),

              const SizedBox(height: 20),
              TextView(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  value: 'WITHDRAWAL OF CONSENT AND PERMISSION',
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 8),
              TextView(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  value:
                  "You may withdraw your consent to submit any or all Personal Information or decline to provide any permissions on its Website as covered above at any time. In case, you choose to do so then your access to the Website may be limited, or we might not be able to provide the services to you. You may withdraw your consent by sending an email to privacy@go-PH.com.",
                  customColor: ColorConstant.blueColor),

              const SizedBox(height: 20),
              TextView(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  value: 'YOUR RIGHTS QUA PERSONAL INFORMATION',
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 8),
              TextView(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  value:
                  "You may access your Personal Information from your user account with PH. You may also correct your personal information or delete such information (except some mandatory fields) from your user account directly. If you don’t have such a user account, then you write to privacy@go-PH.com",
                  customColor: ColorConstant.blueColor),


              const SizedBox(height: 20),
              TextView(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  value: 'ELIGIBILITY TO TRANSACT WITH PH',
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 8),
              TextView(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  value:
                  "You must atleast 18 years of age to transact directly with PH and also to consent to the processing of your personal data.",
                  customColor: ColorConstant.blueColor),

              const SizedBox(height: 20),
              TextView(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  value: 'CHANGES TO THE PRIVACY POLICY',
                  customColor: ColorConstant.blueColor),
              const SizedBox(height: 8),
              TextView(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  value:
                  "We reserve the rights to revise the Privacy Policy from time to time to suit various legal, business and customer requirement.We will duly notify the users as may be necessary.\nYou may always submit concerns regarding this Privacy Policy via email to us at privacy@go-PH.com .\nPH shall endeavor to respond to all reasonable concerns and inquires.",
                  customColor: ColorConstant.blueColor),

            ],
          ),
        ),
      ),
    );
  }
}
