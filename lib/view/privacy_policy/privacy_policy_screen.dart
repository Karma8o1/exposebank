import 'package:flutter/material.dart';

import '../../const/exports.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,

      /// appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: const BackButton(
          color: AppColors.whiteColor,
        ),
        title: Text(
          'Privacy Policy',
          style: poppinsRegular.copyWith(
            fontSize: 18.0,
            color: AppColors.whiteColor,
          ),
        ),
      ),

      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                description('The following translation is provided for the customer’s convenience only. The contractual language depends on your SignUp-Country. This language (“SignUp-Language”) is binding in all respects. Constructions, meanings or interpretations in the SignUp-Language shall prevail in case there is any inconsistency between the English (convenience version) and the SignUp-Language version of all legal documents.'),

                head('Privacy Policy'),

                description('(Version 6.4 Date 01.07.2022) '
                    '\n\nIn the this Privacy Policy, we shall inform you about the collection, use and processing of personal data when using our website https://exposebanque.com (hereinafter: “Website”), our web application (hereinafter: “Web App”) and our mobile app (hereinafter: “App”; jointly called: “Services”). Insofar as information refers exclusively to our  Website, Web App or App, we shall explicitly point this out to you. '
                    '\n\nIn this context, personal data  means all detailed information about personal or factual circumstances of a speciﬁc or identiﬁable natural person, such as e.g. name, telephone number or address. We process your personal data either  within  our  business relation if you are Expose BanQ  customer or when you are visiting our website for informative purposes. In addition to that - if necessary for providing our services - we transfer personal to other companies within the Expose BanQ  Group or other third parties who process your data permissibly (e.g. to execute orders or contracts or because of your given consent). Furthermore we process personal data coming from publicly accessible sources (e.g. records of debtors, trade registers, registers of associations, media, press, internet). The collecting and processing of publicly available data is permitted. '
                    '\n\nWhen using additional Expose BanQ  products or products of our business partners additional personal data might be collected, processed and stored. Please ﬁnd details concerning the processing of additional data in the respective product category.'),

                headingTwo('Controller'),
                description('The responsible body for the collection, processing and use of personal data is: '
                    '\n\nExpose BanQ '
                    '\n\nDouala, Cameroon '
                    '\n\nExpose BanQ  has appointed a Data Protection Oﬃcer. '
                    '\n\nYou will ﬁnd more detailed information regarding Expose BanQ  (hereinafter “Expose”) in the Impressum.\n\nFor the technical provision of our Services, Expose BanQ  is supported by Expose BanQ , Douala, Cameroon and is bound by its instructions. With regard to the collection, use and processing of data within the framework of our Services, there is a written agreement between Expose BanQ  (Client) and Expose BanQ  (Contractor) concerning contract data processing.'),

                headingTwo('Data processing purpose and legal basis'),
                description('We process your personal data in accordance with the General '
                    'Data Protection Regulation (GDPR) and the Data Protection Act (BDSG) '
                    'if at least one of the following applies:'),

                pointTexts('the processing is necessary for the performance of a contract to which the data subject is party or in  order  to take steps at the request of the data subject prior to entering into a contract (Art. 6 1b) GDPR) '
                    '\n\nPersonal data is processed to conduct ﬁnancial services and banking transactions in order to fulﬁll our contractual and pre-contractual obligations. These actions are only taken when requested by you.'
                    '\n\nYou ﬁnd the data processing purpose in the respective product category as well as in the General Terms and Conditions. The data processing can include requirement analysis, consultation, investment management, asset support as well as performing transactions.'),

                pointTexts('the data subject has given consent to the processing of his or her personal data for one or more speciﬁc purposes (Art. 6 1a) GDPR)'
                    '\n\nIn case you gave your consent to the processing of your personal data for speciﬁc purposes, the processing is permitted on the legal basis of your consent. Your consent is revocable at any time. If you revoked your consent any processing of your personal data will become unlawful after the revocation. This means that the previous processing of your data remains lawful. You may request information about your given consents at any time.'),

                pointTexts('processing is necessary for the purposes of the legitimate interests pursued by the controller or by a third party, except where such interests are overridden by the interests or fundamental rights and freedoms of the data subject which require protection of personal data, in particular where the data subject is a child (Art. 6 1f) GDPR) '
                    '\n\nIf necessary, we process your personal data beyond our contractual obligations in order to protect our legitimate interests or the legitimate interests of a third party, e.g.:'),

                subPointTexts('Data access and data transfer to credit agencies to determine credit risks and the requirement of an account with a ﬁxed amount exempt from garnishment or a basic account'),
                subPointTexts('Examination and Optimization of processes concerning requirement analysis and customer approach including customer segmentation and calculation of probability of closure'),
                subPointTexts('Marketing or market and opinion analysis, in case you gave your speciﬁc consent'),
                subPointTexts('Assertion of of claims and defence within legal disputes'),
                subPointTexts('To ensure It security'),
                subPointTexts('Fraud prevention through processing of device related data'),
                subPointTexts('To prevent criminal acts'),
                subPointTexts('For business management and the development of services and products'),
                subPointTexts('Risk management within the Expose BanQ  Group'),

                pointTexts('processing is necessary for compliance with a legal obligation to which the controller is subject (art. 6 1c) GDPR) and processing is necessary for the performance of a task carried out in the public interest or in the exercise of oﬃcial authority vested in the controller (Art. 6 e) GDPR) '
                    '\n\nExpose BanQ  is subject to several legal obligations as well as regulatory requirements. '
                    '\n\nThe purpose of processing your personal data is e.g. veriﬁcation of your identity and age, prevention of money laundering and fraud, veriﬁcation of your credit rating, control and reporting obligations due to tax laws and risk assessment of the Expose BanQ .'),

                pointTexts('Processing on behalf of Expose BanQ  (Art. 28 GDPR) '
                    '\n\nWhere processing of personal data is carried out on behalf of Expose BanQ we conclude a separate contract with the processor with respect to this processing. This contract ensures compliance with GDPR and deﬁnes suﬃcient guarantees for the implementation of appropriate technical and organisational measures, which ensure the protection of your rights.'),

                pointTexts('In terms of the transmission of data, including personal data, to recipients outside of Expose BanQ, Expose BanQ is subject to banking secrecy (see section 2 “Terms & Conditions - Basic Rules Governing the Relationship between Customer  and the Bank”). Expose BanQ only transmits data to third parties, when this is required by law, you consented to the transmission or Expose BanQ is authorised to issue a bank reference. Under these conditions recipients of personal data may be'),
                subPointTexts('Public authorities and institutions BEAC, Financial Authorities, Law Enforcement Agency;'),
                subPointTexts('Other Credit- and Financial Services Institutes or similar institutions, to which we transmit personal data that are necessary for the performance and processing of the business relationship;'),
                subPointTexts('Other companies within the Expose BanQ Group for risk controlling due to legal or oﬃcial obligation;'),
                subPointTexts('Service providers who are processing personal data on behalf of Expose BanQ: Where processing of personal data is carried out on behalf of Expose BanQ we conclude a separate contract with the processor with respect to this processing. This contract ensures compliance with GDPR and deﬁnes suﬃcient guarantees for the implementation of appropriate technical and organisational measures, which ensure the  protection  of  your rights.'),

                description('\n\nFurther data recipients may be institutions, for which you consented to the data transmission and released Expose BanQ  banking secrecy in this regard or for which Expose BanQ is entitled to transmit personal data due to its legitimate interest.'),

                headingTwo('Data processing within the framework of Expose products (in each case, if applicable in your country)'),

                headingThree('Data collection and processing in case of opening and using the Expose current account.'),

                description('Inter alia, the following data will be collected, used and processed by Expose BanQ  for the purpose of opening a current account with Expose BanQ  (“Sign-up”) and using the Services of Expose BanQ :'),
                pointTexts('First name and surname'),
                pointTexts('Date of birth'),
                pointTexts('Place of birth'),
                pointTexts('Email address'),
                pointTexts('Nationality'),
                pointTexts('Registered address'),
                pointTexts('Mobile telephone number'),
                pointTexts('Tax-ID'),
                pointTexts('Identiﬁcation document including (for details see “Identiﬁcation process”)'),
                pointTexts('Type of identiﬁcation document'),
                pointTexts('Issue date'),
                pointTexts('ID number'),
                pointTexts('And issuing authority'),

                description('\n\nPlease note that it is not possible to open an account, if you don’t provide your personal data.'
                    '\n\nIn order to process transactions Expose receives personal data and transfers personal data according to Art. 4 Funds Transfer Regulation to payers, recipients and other ﬁnancial institutions.'
                    '\n\nDuring the creation of your Expose Account we might ask you to submit additional documents for veriﬁcation. The lawful basis of this processing is Article 6 (1) c) GDPR as the processing is required to comply with legal obligations stemming from Anti Money Laundering laws. '
                    '\n\nWhat personal data we will be processing depends on the document we are requesting and receiving from you. Such documents can be a proof of residence (such as a gas, water or electricity bill less than 3 months old or a registration certiﬁcate), a proof of salary (such as an employment contract, salary statement or statement of assets and income; in case you send us one of the two latter ones, we ask you to please black out any data related to your religious beliefs and family status, if provided therein), your visa documentation or proof of study which states the reason why you live in the country indicated by you as country of residence, or a document attesting your source of wealth (contracts, bank statements, information around asset sales, capital gains or inheritance).'
                    '\n\nOnce you send us any of the mentioned documents they will be assessed manually by Expose BanQ  to verify and conﬁrm that we have all the data about you that we need in order to open your account with us. '
                    '\n\nIn case the information you sent us upon our request is not suﬃcient, we will reach out to you and ask you for more documentation, which is equally subject to the above mentioned.'),

                headingThree('Data transmission within the framework of Expose Invest'),
                description('Within the framework of our optional investment service Expose Invest. In case our customers wish to use this service, inter alia, the following data will be transmitted to our finance partner for creating a portfolio and concluding a depositary agreement.'),
                pointTexts('Identiﬁcation data: User ID'),
                pointTexts('First name and surname'),
                pointTexts('Date and place of birth'),
                pointTexts('Sex'),
                pointTexts('Email address'),
                pointTexts('Address'),
                pointTexts('Mobile telephone number'),
                pointTexts('Identiﬁcation document type'),
                pointTexts('Identiﬁcation document number'),
                pointTexts('Nationality'),
                pointTexts('Issuing authority'),
                pointTexts('Issue date'),
                pointTexts('Tax number'),
                pointTexts('Tax residence'),
                pointTexts('IBAN'),

                headingThree('Data transmission in the framework of Expose BanQ Fixed Savings'),
                description('According to Art. 6 1b) GDPR, Expose BanQ has the right to process and use the personal customer data that Expose BanQ has gained as part of the business relationship with the customer for the purposes of contract implementation.'
                    '\n\nAs part of the services Expose BanQ renders for the customer, it is necessary for certain personal data to be exchanged between Expose BanQ, UBA and the partner bank with which the customer wishes to conclude or has concluded a deposit contract. This personal data includes the form of address, title, ﬁrst name(s), last name, street/street number, postcode/place, email address, mobile number, the deviating shipping address (where applicable), nationality, date of birth, birth place, birth country, marital status, job, job ﬁeld (where applicable), tax identiﬁcation number and  residency,  IBAN and BIC of the reference account, documentation provided by the customer as well as information regarding the balance and status of  the  customer’s deposits. As the contract data processor, N26 provides Raisin GmbH with the named data for the purposes of concluding the contract with the customer.'),

                headingThree('Data transmission in the framework of Google Pay and Apple Pay'),
                description('In order to be able  to use the mobile ﬁnancial services of Google and Apple, information concerning your current account is transferred to our processor Mastercard MPTS. The information are tokenized at Mastercard MPTS. The tokens are used to authorize and to perform transactions with one of the mentioned service providers. Your personal data will be shared with Alphabet Inc. (Google) or Apple Inc. as Google and Apple provide the technological basis. In case you deactivate these services, the token generated by MPTS is automatically deactivated and erased.'),

                headingThree('Data transmission in the framework of the Flutterwave Top Up Feature'),
                description('In order to be able to use the Flutterwave Top Up Feature (“Top Up Feature”), account information is transferred to our processor Flutterwave Payments. (“Flutterwave”), Cameroon. The Top Up Feature provides an easy method for new customers to add funds to their accounts instantly. For this purpose Expose BanQ transmits information regarding payment details (cardholder name, email address, unique customer identiﬁer, order ID, bank account details, payment card details, card expiration date, CVC code, date, time and amount of transaction, merchant name/ID and location) to Flutterwave. Flutterwave will also process your data in order to fulﬁl its legal obligations, like monitoring fraudulent payment transactions, know-your-customer obligations and anti-money-laundering screening. Stripe and Expose BanQ only exchange anonymized tokens and Expose BanQ never sees or stores your card details. The usage of the Top Up Feature is entirely voluntary for eligible customers and you can close it at any point.'),

                headingThree('Visibility and access to your phone’s contact list when using certain N26 in-app features'),
                description('In the context of using certain Expose BanQ features, Request from friends, Shared Spaces, Split the bill or Money QR Code we ask you to (i) grant us consent to be visible to other Expose BanQ users as an Expose BanQ customer and/or ii) to allow Expose BanQ to access your phone’s contact list. With the ﬁrst consent you are releasing Expose BanQ from banking conﬁdentiality regarding your visibility as Expose BanQ customer for other Expose BanQ users. Because by granting Expose BanQ permission to share your status being a Expose BanQ customer, we can display this information to the Expose BanQ clients from your contact list in the context of using the Expose BanQ features. The second consent will enable Expose BanQ to access your phone’s contact list and display which of your contacts are also Expose BanQ clients, provided they have likewise made themselves “visible” as such. You may revoke the consent to being visible by accessing the app and opt-out, at any time. How to manage your visibility is explained.'),

                headingThree('Data transmission in the framework of Open Banking'),
                description('To comply with a request to access your Expose BanQ account for payment initiation services, account information services and conﬁrmation on the availability of funds (“Open Banking Request”), your personal data is provided to authorised third party payment service providers. The personal data will include your name, IBAN, Bank Account ID and Expose BanQ User ID. We provide the personal data you request through a licensed third party described in this section on the basis that it is necessary to comply with our obligation under the Cameroon Payment Services Supervision Act to provide an interface for communication with licensed payment service providers of your choice and that it is necessary to perform our obligations under the Expose BanQ  current account contract.'),

                headingThree('Data processing in the framework of the Statistics feature'),
                description('The Statistics feature is available within the Expose BanQ app. The feature sorts your transactions/payments and visualises your spendings in a variety of categories to oﬀer you valuable insights on your spending behaviour. Certain functions of the Statistics feature allow you to set a monthly spending budget. We will send you push notiﬁcations once you have reached 80% and 100% of your monthly budget. You can adjust the frequency of these reminders in your Expose BanQ app. In order to be able to send push notiﬁcations to you as a Expose BanQ customer, we use the service Amazon SNS, provided by our data processor Amazon Web Services EMEA SARL, 38 Avenue John F. Kennedy, Luxembourg 1855, Luxembourg. For this purpose Expose BanQ transmits data relating to your device (type of device, language), your IP address, your T&C country and your account type/tier to our data processor. In order to oﬀer the Statistics feature to you within the Expose BanQ app, we process transaction data (i.e. data relating to the sender and recipient of a transaction), payment data (i.e. data relating to card payments such as the name of the retailer) and data relating to certain actions by the user (i.e. hashtags created by the user for purposes of spending categorisation) according to Art. 6 para. 1 lit. b GDPR.'),

                headingThree('Data processing when displaying In-App-Updates'),
                description('If you use the app, so-called in-app-updates will be displayed. The purpose of the in-app- updates is to inform you about the content of your contract, new functionalities of the app or app updates and releases and to give you tips for an optimized use of the app. We will process your user and transaction data (e.g. recent transactions, withdrawals, friend referrals etc.) in order to provide you with the relevant in-app-updates. We process your data to the extent necessary to display relevant information about the existing contract with us or the improved use or new functionalities in the app (Art. 6 section 1 b) GDPR).'
                    '\n\nIn addition, the in-app-updates may help you to ﬁnd information about our new services and products related to the app. In order to display in-app-updates relevant to you, we will process your user and transaction data (e.g. recent transactions, withdrawals, friend referrals, etc.). We process your data within the scope of our legitimate interests as far as this is necessary to display our new services and products that are of interest to you (Art. 6 section 1 f) GDPR).'),

                headingThree('Data processing when using the Customer Chat'),
                description('If you use our customer chat on our website or within our app, your IP-Address and the information you provide us in your chat communication will be collected and processed. We process your data to the extent necessary to fulﬁl a contract with you or to carry out pre-contractual measures you have requested, Art. 6 section 1 b) GDPR. '
                    '\n\nIn addition, we process your data within the scope of our legitimate interests as far as this is necessary to answer your general questions about  our  services  and  products and to help you ﬁnd information about our new services and products related to the app, Art. 6 section 1 f) GDPR.'),
                
                headingThree('Data processing in the framework of the Waiting Lists for regions where we are not yet available'),
                description('When you ask us to add you to our waiting list for information on when we’re providing our banking services in your region, the following data will be collected and processed so that we can inform you once we launch our services in your region:'),
                pointTexts('Country of Residence'),
                pointTexts('Email address'),
                pointTexts('Language selected by you when using our website'),

                description('The legal basis of the processing of these data is Art. 6 (1) (b) GDPR. Please note that it’s not possible to include you in the waiting list if you do not provide us with the referred personal data. Your data will be kept on our waiting list for your market for 18 months after you were included therein and will be deleted in case that period of time lapses and we do not plan to launch our services in your region in the meantime. '
                    '\nIf, after that period of time, you continue to be interested in being included in the waiting list, please ask us again to be added thereto.'
                    '\n\nBased on your decision to be added to the waiting list, we will send you emails containing the following information:'),

                pointTexts('Conﬁrmation that you were successfully added to the waiting list'),
                pointTexts('Information on products/services you may expect as a future Expose BanQ customer in your market, once the launch is getting closer, so you can decide if you are still interested to sign-up'),
                pointTexts('Notiﬁcation, that Expose BanQ is launching soon in your market, for example containing the envisaged launch date and information about how to sign up'),
                pointTexts('Information containing a link to sign up for a Expose BanQ account, once Expose BanQ is launching in your market'),

                headingThree('Data processing in the framework of informational communication'),
                description('We use informational emails, in-app-updates and push notiﬁcations to inform you about transactions, withdrawals, and other relevant information related to your usage of our app. For some informational emails, in app updates and push notiﬁcations we screen and analyse your user behavior (e.g. recent transactions, withdrawals, friend referrals, etc.) to send you (additional) information about these processes via emails, in-app-updates or push notiﬁcations. We will only send you these emails, in-app-updates and push notiﬁcations based on your user behavior if the processing is necessary for the performance of the contract or within the scope of our legitimate interests as far as this is necessary to provide such information. The legal justiﬁcation for sending you informational emails, in-app-updates and push notiﬁcations by using data related to your user behavior is Art. 6 Section 1 b) or f) GDPR.'),

                headingThree('Preparing anonymised statistical datasets'),
                description('We prepare anonymised statistical datasets about our customers’ spending patterns for forecasting purposes, reﬁning product development and understanding consumer behaviour and assess  our  companies performance. We may share these datasets internally or externally with others. The reports are produced by using information about you and other customers, however the information used and shared in this way is never personal data and you will never be identiﬁable from it. You cannot be linked back as an individual within anonymised statistical data.'
                    '\n\nOur legal basis is one or both of the following: '
                    '\n\nlegitimate interests (to conduct research and analysis, including to produce statistical research and reports); or legal obligations.'
                    '\n\nThe following example gives you an idea how we are using anonymised datasets'),

                headingTwo('Identiﬁcation procedure'),
                headingThree('Liveness-detection photo and video-ident procedure and video-ident procedure'),
                description('Expose BanQ is legally obligated to check your identity using a valid identiﬁcation document within the framework of opening an account and to store speciﬁc information from the identiﬁcation document.'
                    '\n\nFor this purpose, we oﬀer you a liveness-detection photo and video-ident procedure (with the combination of photo and video) through our reliance partner Safened-Fourthline or, if you reside in Cameroon, a video-ident procedure through our service provider IDNow, as well as a Post-ident procedure (see below).'
                    '\n\nFor the purpose of the liveness-detection photo- and video-ident procedure or the video-ident procedure, personal data is collected as proof of your eligibility to use our services. In both cases, identity is veriﬁed by means of a liveness-detection photo and video procedure or of a video identiﬁcation procedure via an encrypted transmission path. Expose BanQ may transmit personal data to external service providers for the purpose of verifying your identity.'
                    '\n\nRegarding the liveness-detection photo and video-ident performed by Safened-Fourthline, we refer to the Safened-Fourthline Terms and Conditions, which we provide to you within the identiﬁcation process. The processing of personal data is justiﬁed on the basis of Art. 6 1c) GDPR. Safened-Fourthline will, after your authorization to do so, access the camera of your end device and a photograph of you will be taken by yourself, as well as a video in which you will be requested to move, and the front and rear sides of your personal identiﬁcation document or the principal page of your passport.'
                    '\n\nIf your country’s regulation requires video-ident procedure (Cameroon) you will be asked to identify yourself directly via live video. During the video-ident conﬁrmation, our provider IDNow must ensure the authenticity of the personal identity document or passport presented by you. At the start of the video-ident procedure, the employee will ask for your express consent according to Art. 6 1a) GDPR to the taking of the photographs and the recording of the conversation.'
                    '\n\nThe photograph as well as the live video will be recorded and retained as long as required by law for evidentiary purposes.'),

                headingTwo('Social Plugins'),
                description('On our website as well as in our Support Center we have share buttons linking to Facebook, YouTube, Linkedin, Twitter, Instagram and Glassdoor. These are not third-party plugins, and do not send actively or allow third parties to  fetch  personal data or any other sort of information whatsoever. The share buttons are hyperlinks that only redirect you to the respective website of the third party when clicked.'),

                headingTwo('Marketing Communication'),
                headingThree('Marketing E-Mails'),

                description('In our marketing emails, we inform you about our oﬀers. If you would like to receive marketing emails, we require an email address from you. We will only send you marketing emails if you expressly consent to this as you open an account (so called double opt-in), Art. 7 section 2 no. 3 Cameroon Act against Unfair Competition. In order to ensure that we only send you information that is most relevant to you and corresponds with your personal interests, we screen and analyse your user behavior (e.g. recent transactions, withdrawals, friend referrals, etc.) and use this information for some marketing emails. Once you created your account you can also give or revoke your consent to receive marketing emails in the app settings. We will thereby check whether you are the holder of the email address given or its holder is in agreement with receiving marketing emails. This storage solely serves as proof in case a third party misuses an email address and registers to receive the marketing emails without the knowledge of the entitled party. These data will only be used for sending you marketing emails and will not be disclosed to third parties. You can revoke your consent as well as object the data processing for sending marketing emails at any time. The revocation can be made via a link in the marketing email, via a message to the contact options below or directly in the app settings. The legal basis for the data processing in order to send marketing emails based on your user behaviour is our legitimate interest, Art. 6 section 1 f) GDPR.'),

                headingThree('Marketing Push Notiﬁcations'),
                description('In our marketing push notiﬁcations, we inform you about our oﬀers. Push notiﬁcations are messages you receive on your phone without a speciﬁc request and regardless whether the Expose BanQ application is open. We will only send you marketing push notiﬁcations if you expressly consent to this as you open an account. Art. 7 section 2 no. 3 Cameroon Act against Unfair Competition. In order to ensure that we only send you information that is most relevant to you and corresponds with your personal interests, we screen and analyse your user behavior (e.g. recent transactions, withdrawals, friend referrals, etc.) and use this information for some marketing push notiﬁcations. Once you created your account you can also give or revoke your consent to receive marketing push notiﬁcations in the app settings. We screen and analyse your user behavior (e.g. recent transactions, withdrawals, friend referrals, etc.) to ﬁnd out what information might be interesting for you and send you push notiﬁcations according to your interests and needs. You can revoke your consent as well as object the data processing for sending marketing push notiﬁcations at any time. The revocation can be made in the app settings. The legal basis for the data processing in order to send marketing push notiﬁcations based on your user behaviour is our legitimate interest, Art. 6 section 1 f) GDPR.'),

                headingThree('Marketing In-App-Updates'),
                description('In our marketing in app updates, we inform you about our oﬀers. In app updates are small sections within the app providing you with contextual and personalised information. In order to ensure that we only send you information that is most relevant to you and corresponds with your personal interests, we screen and analyse your user behavior (e.g. recent transactions, withdrawals, friend referrals, etc.) and use this information for some marketing in app updates. We will only send you these in app updates based on your user behavior if you expressly consent to this as you open an account or within the app settings. You can revoke your consent to receive in app updates for marketing purposes based on your user behavior at any time. The revocation can be made in the app settings. The legal basis for the data processing in order to send marketing in-app-updates based on your user behaviour is our legitimate interest, Art. 6 section 1 f) GDPR.'),

                headingThree('Customer Chat'),
                description('In our customer chat we inform you about our products, services and oﬀers. To ensure that we only send you information that is relevant to you and matches your personal interests, we review and analyze your user behaviour (e.g. recent transactions, withdrawals, chat histories etc.) and use this information accordingly. The legal basis for processing this information via the  Customer  Chat  based on your user behaviour is our legitimate interest in accordance with Art. 6 section 1 f) GDPR.'),

                headingThree('Transmission of personal data abroad'),
                description('Insofar as Expose BanQ transmits data to states outside of the scope of application of Directive 95/46/EC of the European Parliament and of the Council of 24 October 1995 for the protection of natural persons during the processing of personal data and for the free movement of data, Expose BanQ shall ensure that the recipient of the data guarantees an appropriate level of data protection. In order to ensure an appropriate level of protection by the recipient of the data, '
                    '\n\nData collected in the framework of phone call recordings'
                    '\n\nWhen discussing any contractual matters (such as account related information or your transactions) with us on the phone, the call between us will be recorded for security and evidence reasons. Our interest to be able to prove contractual inquiries as well as to prevent and detect fraudulent behaviour, gives us a legitimate interest to record calls in accordance with Article 6 (1) f) GDPR. This does not apply to calls aimed at clarifying general inquiries related to Expose BanQ products and services.'
                    '\n\nThe call recordings will be retained as long as required for security and evidentiary purposes. If you do not wish to be recorded when calling us, please do contact us by email or through our Customer Chat for queries related to account related information or your transactions.'),

                headingThree('Rights'),
                description('You have the following rights concerning your personal data: right of access according to Art. 15 GDPR, right of rectiﬁcation according to Art. 16 GDPR, right to erasure according to Art. 17 GDPR, right to restriction of the processing according to Art. 18 GDPR, right to object according to Art. 21 GDPR, as well as the right to data portability according to Art. 20 GDPR. Please note, that the restrictions of sec. 34 and 35 BDSG apply to the right of access and the right to erasure. In addition to that, according to Art. 77 GDPR and sec. 19 BDSG you have the right to appeal to the Cameroon Data Protection supervisory authority. To make use of your right to object against the processing of your personal data for direct marketing purposes under Art. 21 (2) GDPR,'
                    '\n\nEmail; service@exposebanque.com '
                    '\n\nPlease do not address your requests through a third party platform which requires us to get back to you through that same means, since we are not able to clearly identify you as an Expose BanQ customer in such cases. Instead, please resort to the aforementioned ways of making use of your rights before Expose BanQ.'),

                headingThree('Revocation and objection right'),
                pointTexts('Right to revoke your consent, Art. 7 (3) GDPR '
                    '\n\nYou have the right to revoke your consent to the processing of your personal data at any time with eﬀect for the future. In the event you revoke your consent, your personal data is not processed any longer, unless further processing can be based on a diﬀerent legal basis for processing (excluding consent). The processing of your personal data remains justiﬁed until the date of your revocation.'),

                pointTexts('Right of objection, Art. 21 (1) GDPR '
                    '\n\nYou have the right to object to the processing of your personal data, which is processed in accordance with Art. 6 (1) (e) and Art. 6 (1) (f) GDPR, at any time. This does also include proﬁling according to Art. 4 (4) GDPR. In case you object, your personal data is not processed any longer, except when we have legitimate reasons to continue the processing,  which  exceed your interests, rights and liberties or when the processing is necessary to enforce, exercise or defend legal claims. The processing of your personal data remains justiﬁed until the date of your objection.'),
                pointTexts('Right of objection concerning data processing for direct marketing purposes, Art. 21 (2) GDPR '
                    '\n\nIn some cases, we process your personal data for direct marketing purposes. You have the right to object to the processing of your personal data for direct marketing purposes at any time. This also applies to proﬁling, in case it is connected to direct marketing purposes. In case you object to the processing of your personal data for direct marketing purposes, your personal data is not processed any longer for this purpose.  The processing of your personal data remains justiﬁed until the date of your objection.'),

                headingThree('Deletion and retention periods'),
                description('We are basically storing and processing your personal data only as long as it is necessary to perform our obligations under the agreement with you or as long as the law requires us to store it. That means, if the data is not required anymore for statutory or contractual obligations, your data will normally be deleted'),
              ],
            ),
          ),
        ),
      ),

    );
  }

  Widget description(texts) => Text(
    texts,
    style: poppinsLight.copyWith(
      fontSize: 12.0,
      color: AppColors.whiteColor,
      height: 1.7,
    ),
  );

  Widget head(texts) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Text(
      texts,
      style: poppinsSemiBold.copyWith(
        fontSize: 24.0,
        color: AppColors.whiteColor,
        height: 1.7,
      ),
    ),
  );

  Widget headingTwo(texts) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          height: 6.0,
          width: 6.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Text(
            texts,
            style: poppinsSemiBold.copyWith(
              fontSize: 17.0,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ],
    ),
  );

  Widget headingThree(texts) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          height: 6.0,
          width: 6.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Text(
            texts,
            style: poppinsSemiBold.copyWith(
              fontSize: 14.0,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ],
    ),
  );

  Widget pointTexts(texts) => Padding(
    padding: const EdgeInsets.only(top: 16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 16.0),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          height: 5.0,
          width: 5.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Text(
            texts,
            style: poppinsLight.copyWith(
              fontSize: 12.0,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ],
    ),
  );

  Widget subPointTexts(texts) => Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 40.0),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          height: 5.0,
          width: 5.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Text(
            texts,
            style: poppinsLight.copyWith(
              fontSize: 12.0,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ],
    ),
  );
}
