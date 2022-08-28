import 'package:flutter/material.dart';

import '../../const/exports.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
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
          'FAQs',
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
                Text(
                  'Expose BanQ Frequently Asked Questions (FAQ)',
                  style: poppinsLight.copyWith(
                    fontSize: 13.0,
                    color: AppColors.whiteColor,
                  ),
                ),

                /// heading
                heading('Deposits, Payments, Transfers & Withdrawals'),

                questionText(
                    'HOW CAN I DEPOSIT MY MONEY INTO MY BANK ACCOUNTS IN EXPOSE?'),

                answerText(
                    'You can make several deposits into any of your bank accounts, it is a 24 hours service. '
                    '\n\nYou can deposit from your mobile money accounts, or your bank '
                    'account with another banks or a direct cash deposit using any of '
                    'our shop partners next to you.'),

                questionText(
                    'CAN I WITHDRAW MY MONEY FROM MY BANK ACCOUNTS IN EXPOSE?'),
                answerText(
                    'Yes, you can make several withdrawals from any of your accounts, '
                    'it is a 24 hours service. '
                    '\n\nYou can withdraw from your Expose bank account to your mobile money accounts, or to your bank account with another bank or a direct cash withdrawal from any of our shop partners next to you.'),

                questionText('HOW DOES TRANSFERS WORK?'),
                answerText(
                    'You can transfer money from one of your own bank account to '
                    'another of your own bank account still in Expose BanQ.'
                    ' \n\nYou can transfer money from any of your own bank accounts in'
                    ' Expose to another person’s bank account in Expose even if the '
                    'person is in a different country from you. '
                    '\n\nYou can transfer money from your Expose bank account to '
                    'the bank account of another bank in the same country that '
                    'you are or a different country from you. '
                    '\n\nExpose to Expose transfers are instant and with immediate withdrawals.'),

                heading('What is an Expose BanQ Standard Account?'),
                answerText(
                    'The Expose Standard account is a safe and intuitive digital current account that you can sign up to in minutes, right from your smartphone. It is beautifully simple and transparent, allowing you to receive, send and spend money confidently. The expose Standard account is free, giving you a simple and affordable solution for all of your financial needs.'),

                questionText(
                    'WHAT ARE THE BENEFITS OF AN EXPOSE STANDARD ACCOUNT?'),
                answerText(
                    'Our Expose Standard account comes with the following benefits '
                    'and features: '
                    '\n\nFree current account: Our Expose Standard account is free to use. '
                    '\n\nVirtual card: The account comes with the cheapest virtual card '
                    'in the country that has a full PAN number and is ready to add to '
                    'Apple or Google Pay for online and in shop purchases.'),

                questionText('Can I get a bank statement?'),
                answerText(
                    'Yes, A bank statement is a document that shows the total '
                    'balance of your account and all incoming and outgoing transactions, '
                    'including transfers, direct debits, card payments, etc. '
                    'It also shows the name and surname of the account holder, '
                    'and the IBAN and BIC numbers of the account. '
                    '\n\nPhysical Expose VISA card: For an additional XAF 9000, '
                    'you can receive an Expose Standard physical debit card '
                    '(please note, you will need to have at least that XAF 9000 '
                    'available in your account to trigger card production with your '
                    'name on it and shipment). '
                    '\n\nPayments & Transfers: You can send and receive transfers using '
                    'your Expose mobile app. Additionally, you can send money '
                    'instantly to other Expose customers. '
                    '\n\nAdditional financial products: If eligible you can also '
                    'apply for our additional financial products e.g Overdraft, Credit, '
                    'Savings etc. '
                    '\n\nCustomer Support: You can get in touch with our incredible '
                    'customer service team using the in-app chat feature or opening a '
                    'chat from our website or web-app. '
                    '\n\nOur new Expose Standard account comes with a free virtual '
                    'debit card. With an active standard account, you can make '
                    'online and in-store payments. Additionally, you can add your '
                    'virtual card to your Apple or Google pay wallet.'),

                heading('Is Expose BanQ secure?'),

                answerText(
                    'To protect your account, we use a three-layered security architecture: '
                    '\n\nSecure login. Your login details of both the mobile '
                    'and WebApp consist of a username and password or '
                    'fingerprint/face recognition (depending on your smartphone). '
                    'Please choose a secure password and don’t reveal your '
                    'login details to anyone. '
                    '\n\nConfirmation PIN. This 4-digit code is required '
                    'every time you make a transfer or connect/disconnect your phone. '
                    'You first set it up once you have successfully connected your '
                    'smartphone to your account. You can then change it in '
                    'the app yourself after that. '
                    '\n\nPush messages. For every incoming and outgoing payment, '
                    'a push message will be sent to your connected smartphone. '
                    'It\'s also used to confirm and finalize your transactions. '
                    'We\'ve also added 3D Secure to protect you from online card fraud. '
                    '\n\nEvery time you contact us we’ll ask you some security questions '
                    'to make sure it\'s really you. But we’ll never ask for your debit'
                    ' card number, card verification code (CVV), password, or your'
                    ' card or Confirmation PINs. '
                    '\n\nWe’ve also taken steps to protect your data: we store as little '
                    'information about you as possible, only for as long as we are legally '
                    'obligated to, and we delete data when it is no longer required for '
                    'a product or service.'),

                questionText('How does N26 protect my money?'),
                answerText('How does Expose BanQ detect and monitor fraud?  '
                    '\n\nExpose BanQ has a specialised team focused on monitoring and '
                    'identifying suspicious transactions on our platform. With the help '
                    'of advanced statistical models and algorithms, alongside human'
                    ' behavioural analysis, our team of experts help ensure that your'
                    ' money is always in safe hands. '
                    '\n\nWhat does Expose BanQ do when fraudulent behaviour is detected within its customer base? '
                    '\n\nWhen our team of experts detect irregular activity, we take all mitigation measures, as per regulatory law, to prevent further damage - this includes: closing and reporting offending accounts to the authorities. When suspicious transactions indicate the existence of money laundering, terrorist financing, or any other criminal offence, Expose BanQ immediately reports these activities to the CONAC or local supervisory entities. '
                    '\n\nWhat are some of the ways that Expose BanQ has invested in security? '
                    '\n\nWe built our Trust and Safety team. They work within IT Security and their job is to safeguard users, their accounts and their data, against cybercriminals. Additionally, Expose BanQ doubled the size of its AML team and financial crime unit, and established new transaction monitoring processes and platforms. These enable us to detect and prevent malicious activity based on historical data, which ultimately allows us to remain several steps ahead of malicious actors. We invest heavily in technology and AI to run advanced statistical models and algorithms, alongside human behavior analysis.'),

                questionText('Where does Expose BanQ invest my money?'),
                answerText(
                    'We strive to provide our clients\' deposits for loans to our customers (provided that they have the appropriate credit rating). For the liquidity not required in the customer business, our investment strategy is low in risk. '
                    '\n\nWe invest our customers\' money at short notice with the BEAC banks and other foriegn banks in the with only good risk classes. And we refinance public-law customers in cities and municipalities and invest in franc government bonds. '
                    '\n\nWe\'re not a trading book institute. That is: we do not trade for short-term profit. '
                    '\n\nAnd we don\'t engage in speculation, whether on food, foreign exchange, bitcoins or other asset classes.'),

                questionText('Why does N26 do checks on transactions?'),
                answerText(
                    'We have the responsibility to run routine checks on accounts and transactions in order to ensure your account’s security. These checks are automatically initiated by our systems.  '
                    '\n\nAs a result, we may ask you to provide some documents. If you receive such a request, please send the requested documents via Messages from Expose. There are no exceptions or evasion for such checks.  '
                    '\n\nThis practice is a standard banking procedure and ensures the safety of our customers. Both the process and the result are confidential and handled internally. Here are some tips to speed up the process:'
                    '\n\nThe document that we need you to provide will be exactly named in the message you’ll receive from Expose. You can send us scanned documents, pictures, or screenshots, as long as the original content of the document is easily readable. Please make sure to also provide a detailed description. '
                    '\n\nBe precise in your answers, details, and documents. After we receive your required proof and description, we will let you know if your reply fulfills our check. In a few cases, we might ask for further clarification which could prolong the process. '
                    '\n\nReply as soon as possible, always before the deadline stated in the message you received from Expose. Use that email to reply and send attachments.  '
                    '\n\nOur Customer Support doesn’t have any additional information on this subject. '
                    '\n\nYou must provide valid documentation depending on your situation. '
                    '\n\nFind here some examples: '
                    '\n\nYou\'ve received financial help from your family to complete projects or have inherited land or money from deceased relatives. A granting/loan contract, an official document of inheritance, or an official document of the source of the loan (such as the sales documents of a sold property to finance the loan or bank statements of granting relatives). '
                    '\n\nYou\'ve sold a property or your shares on the stock market. The contract showing the agreed transactions or the official notarial documentation of the transfer of property.'
                    '\n\nYou\'ve received or sent money to pay bills or buy a product. Documents showing the balance statements confirming the source of this money or documents showing the use of the money and its purpose. '
                    '\n\nYou\'ve received a final payout from your previous employer. Documents proving the end of your employment, detailing the payment and/or a bank statement from your previous employer.'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget heading(texts) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          texts,
          style: poppinsBold.copyWith(
            fontSize: 24.0,
            color: AppColors.whiteColor,
          ),
        ),
      );

  Widget questionText(texts) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          texts,
          style: poppinsMedium.copyWith(
            fontSize: 14.0,
            color: AppColors.whiteColor,
          ),
        ),
      );

  Widget answerText(texts) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          texts,
          style: poppinsRegular.copyWith(
            fontSize: 11.0,
            color: AppColors.whiteColor.withOpacity(0.8),
          ),
        ),
      );
}
