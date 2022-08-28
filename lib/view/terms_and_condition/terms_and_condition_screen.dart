import 'package:flutter/material.dart';

import '../../const/exports.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
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
          'Terms and Condition',
          style: poppinsRegular.copyWith(
            fontSize: 18.0,
            color: AppColors.whiteColor,
          ),
        ),
      ),

      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// heading one
                headingText(
                    'Basic Rules Governing the Relationship Between the Customer and the Bank'),

                /// heading two
                headingTwo(
                    'Scope of Application and Amendments of these Business '
                    'Conditions and the Special Conditions for Particular '
                    'Business Relations'),

                headingThree('Scope of Application'),
                description(
                    'The General Business Conditions govern the entire business '
                    'relationship between the Customer and the bank’s domestic oﬃces '
                    '(hereinafter referred to as the “Bank”). In addition, particular '
                    'business relations (securities transactions, payment services '
                    'and savings accounts, for example) are governed by Special Conditions, '
                    'which contain deviations from, and complements to, these General '
                    'Business Conditions; they are agreed with the Customer when the '
                    'account is opened or an order is given. If the Customer also '
                    'maintains business relations with foreign oﬃces, the Bank’s '
                    'lien (No. 14 of these Business Conditions) also secures the '
                    'claims of such foreign oﬃces.'),

                headingThree('Amendments'),
                description(
                    'Any amendments of these Business Conditions and Special '
                    'Conditions shall be oﬀered to the Customer in the agreed upon '
                    'form of communication. The changes will only become eﬀective '
                    'upon the Customer’s consent.'),

                headingTwo('Banking Secrecy and Disclosure of Banking Aﬀairs'),

                headingThree('Banking Secrecy'),
                description(
                    'The Bank has the duty to maintain secrecy about any customer-related facts and evaluations of which it may have knowledge (banking secrecy). The Bank may only disclose information concerning the Customer if it is legally  required to do so or if the Customer has consented thereto or if the Bank is authorized to disclose banking aﬀairs.'),

                headingThree('Disclosure of Banking Aﬀairs'),
                description(
                    'Any disclosure of details of banking aﬀairs comprises statements and comments of a general nature concerning the economic status, the creditworthiness and solvency of the Customer; no information shall be disclosed as to amounts of balances of accounts, of savings deposits, of securities deposits or of other assets entrusted to the Bank oras to amounts drawn under a credit facility.'),

                headingThree(
                    'Prerequisites for the Disclosure of Banking Aﬀairs'),
                description(
                    'The Bank shall be entitled to disclose banking aﬀairs concerning legal entities and on businesspersons registered in the Commercial Register, provided that the inquiry relates to their business activities. The Bank shall not, however, disclose any information if it has received instructions to the contrary from the Customer. Details of banking aﬀairs concerning other persons, in particular private Customers and associations, shall be disclosed by the Bank only if such persons have expressly agreed thereto, either generally or in an individual case. Details of banking aﬀairs shall be disclosed only if the requesting party has substantiated its justiﬁed interest in the information requested and there is no reason to assume that the disclosure of such information would be contrary to the Customer’s legitimate concerns.'),

                headingThree('Recipients of Disclosed Banking Aﬀairs'),
                description(
                    'The Bank shall disclose details of banking aﬀairs only to its own Customers as well as to other credit institutions for their own purposes or those of their Customers.'),

                headingTwo(
                    'Liability of the Bank – Contributory Negligence of the Customer'),

                headingThree('Principles of Liability'),
                description(
                    'In performing its obligations, the Bank shall be liable for any negligence on the part of its staﬀ and of those persons whom it may call in for the performance of its obligations. If the Special Conditions for particular business relations or other agreements contain provisions inconsistent herewith, such provisions shall prevail. In the event that the Customer has contributed to the occurrence of the loss by any own fault (e.g. by violating the duties to cooperate as mentioned in No. 11), the principles of contributory negligence shall determine the extent to which the Bank and the Customer shall have to bear the loss.'),

                headingThree('Orders Passed on to Third Parties'),
                description(
                    'If the contents of an order are such that the Bank typically entrusts a third party with its further execution, the Bank performs the order by passing it on to the third party in its own name (order passed on to a third party). This applies, for example, to obtaining information on banking aﬀairs from other credit institutions or to the custody and administration of securities in other countries. In such cases, the liability of the Bank shall be limited to the careful selection and instruction of the third party.'),

                headingThree('Disturbance of Business'),
                description(
                    'The Bank shall not be liable for any losses caused by force majeure, riot, war or natural events or due to other occurrences for which the Bank is not responsible (e.g. strike, lockout, traﬃc hold-ups, administrative acts of domestic or foreign high authorities).'),

                headingThree('Set-Oﬀ Limitations on the Part of the Customer'),
                description(
                    'The Customer may only set oﬀ claims against those of the Bank if the Customer’s claims are undisputed or have been conﬁrmed by a ﬁnal court decision.'),

                headingThree('Right of Disposal upon the Death of the Customer'),
                description(
                    'Upon the death of the Customer, any person who approaches the Bank claiming to be the Customer’s legal successor shall be required to furnish suitable proof to the Bank of their entitlement under inheritance law. If an oﬃcial or certiﬁed copy of the testamentary disposition (last will or contract of inheritance) together with the relevant record of probate proceedings is presented to the Bank, the Bank may consider any person designated therein as heir or executor as the entitled person, allow this person to dispose of any assets and, in particular, make payment or delivery to this person, thereby discharging its obligations. This shall not apply if the Bank is aware that the person designated therein is not entitled to dispose (e.g. following challenge or invalidity of the will) or if this has not come to the knowledge of the Bank due to its own negligence.'),

                headingTwo(
                    'Applicable Law and Place of Jurisdiction for Customers who are Businesspersons or Public-Law Entities'),

                headingThree('Applicability of Cameroon Law'),
                description(
                    'Cameroon law shall apply to the business relationship between the Customer and the Bank.'),

                headingThree('Place of Jurisdiction for Domestic Customers'),
                description(
                    'If the Customer is a businessperson and if the business relation in dispute is attributable to the conducting of such businessperson’s trade, the Bank may sue such Customer before the court having jurisdiction for the bank oﬃce keeping the account or before any other competent court; the same applies to legal entities under public law and separate funds under public law. The Bank itself may be sued by such Customers only before the court having jurisdiction for the bank oﬃce keeping the account.'),

                headingThree('Place of Jurisdiction for Foreign Customers'),
                description(
                    'The agreement upon the place of jurisdiction shall also apply to Customers who conduct a comparable trade or business abroad and to foreign institutions which are comparable with domestic legal entities under public law or a domestic separate fund under public law.'),

                SizedBox(height: 24.0),

                headingText('Keeping of Accounts'),

                headingTwo(
                    'Periodic Balance Statements for Current Accounts; Approval of Debit Entries Resulting from Direct Debits'),

                headingThree('Issue of Periodic Balance Statements'),
                description(
                    'Unless otherwise agreed, the Bank shall issue a periodic balance statement for a current account at the end of each calendar quarter, thereby clearing the claims accrued by both parties during this period (including interest and charges imposed by the Bank). The Bank may charge interest on the balance arising therefrom in accordance with No. 12 of these Business Conditions or any other agreements entered into with the Customer.'),

                headingThree('Time Allowed for Objections; Approval by Silence'),
                description(
                    'Any objections a Customer may have concerning the incorrectness or incompleteness of a periodic balance statement must be raised not later than six weeks after its receipt; if the objections are made in text form, it is suﬃcient to dispatch these within the period of six weeks. Failure to make objections in due time shall be considered as approval. When issuing the periodic balance statement, the Bank shall expressly draw the '
                    'Customer’s attention to this consequence. The Customer may demand a '
                    'correction of the periodic balance statement even after expiry of this period, '
                    'but must then prove that the account was either wrongly debited or '
                    'mistakenly not credited.'),

                headingTwo(
                    'Reverse Entries and Correction Entries Made by the Bank'),

                headingThree('Prior to Issuing a Periodic Balance Statement'),
                description(
                    'Incorrect credit entries on current accounts (e.g. due to a wrong account number) may be reversed by the Bank through a debit entry prior to the issue of the next periodic balance statement to the extent that the Bank has a repayment claim against the Customer (reverse entry); in this case, the Customer may not object to the debit entry on the grounds that a disposal of an amount equivalent to the credit entry has already been made.'),

                headingThree('After Issuing a Periodic Balance Statement'),
                description(
                    'If the Bank ascertains an incorrect credit entry after a periodic balance statement has been issued and if the Bank has a repayment claim against the Customer, it shall debit the account of the Customer with the amount of its claim (correction entry). If the Customer objects to  the  correction  entry, the Bank shall recredit the account with the amount in dispute and assert its repayment claim separately.'),

                headingThree(
                    'Notiﬁcation to the Customer; Calculation of Interest'),
                description(
                    'The Bank shall immediately notify the Customer of  any reverse entries and correction entries made. With respect to the calculation of interest, the Bank shall eﬀect the entries retroactively as of the day on which the incorrect entry was made.'),

                headingTwo('Collection Orders'),

                headingThree(
                    'Conditional Credit Entries Eﬀected upon Presentation of Documents'),
                description(
                    'If the Bank credits the countervalue of direct debits prior to their payment,  this  is  done  on condition of payment, even if these items are payable at the Bank itself. If the Customer surrenders other items, instructing the Bank to collect an amount due from a debtor (e.g. interest coupons), and if the Bank eﬀects a credit entry for such amount, this is done under the reserve that the Bank shall obtain the amount. This reserve shall also apply if direct debits and other items are payable at the Bank itself. If direct debits are not paid or if the Bank does not obtain the amount under the collection order, the Bank shall cancel the conditional credit entry regardless of whether or not a periodic balance statement has been issued in the meantime.'),

                headingThree('Payment of Direct Debits'),
                description(
                    'Direct debit authorisations and debit advice mandates shall be deemed to have been paid, unless the debit entry is cancelled prior to the end of the second bank working day[1] after it was made. Direct debits from other schemes shall be subject to the payment rules in the Special Conditions agreed for these.'),

                headingTwo(
                    'Foreign Currency Transactions and Risks Inherent in Foreign Currency Accounts'),

                headingThree(
                    'Execution of Orders Relating to Foreign Currency Accounts'),
                description(
                    'Foreign currency accounts of the Customer serve to  eﬀect  the cashless settlement of payments to and disposals by the Customer in foreign currency. Disposals of credit balances on foreign currency accounts (e.g. by means of  credit transfers to the debit of the foreign currency credit balance) are settled through or by banks in the home country of the currency, unless the Bank executes them entirely within its own organisation.'),

                headingThree(
                    'Credit Entries for Foreign Currency Transactions with the Customer'),
                description(
                    'If the Bank concludes a transaction with the Customer (e.g. a forward exchange transaction) under which it owes the provision of an amount in a foreign currency, it shall discharge its foreign currency obligation by crediting the account of the Customer in the respective currency, unless otherwise agreed.'),

                headingThree('Temporary Limitation of Performance by the Bank'),
                description(
                    'The Bank’s duty to execute a disposal order to the debit of a foreign currency credit balance (Paragraph 1) or to discharge a foreign currency obligation (Paragraph 2) shall be suspended to the extent that and for as long as the Bank cannot or can only restrictedly dispose of the currency in which the foreign currency credit balance or the obligation is denominated, due to political measures or events in the country of the respective currency. To the extent that and for as long as such measures or events persist, the Bank is not obligated either to perform at some other place outside the country of the respective currency, in some other currency (including EUR) or by providing cash. However, the Bank’s duty to execute a disposal order to the debit of a foreign currency credit balance shall not be suspended if the Bank can execute it entirely within its own organisation. The right of the Customer and of the Bank to set oﬀ mutual claims due in the same currency against each other shall not be aﬀected by the above provisions.'),

                headingThree('Exchange Rate'),
                description(
                    'The exchange rate for foreign currency transactions shall be determined on the basis of the “List of Prices and Services” (Preis- und Leistungsverzeichnis). Payment services shall be governed in addition by the payment services framework contract.'),

                SizedBox(height: 24.0),

                headingText('Duties of the Customer to Cooperate'),

                headingTwo('Duties of the Customer to Cooperate'),

                headingThree('Notiﬁcation of Changes'),
                description(
                    'A proper settlement of business requires that the Customer notify the Bank without delay of any changes in the Customer’s name and address, as well as the termination of, or amendment to, any powers of representation towards the Bank conferred to any person (in particular, a power of attorney). This notiﬁcation duty also exists where the powers of representation are recorded in a public register (e.g. the Commercial Register) and any termination thereof or any amendments thereto are entered in that register. Additional statutory notiﬁcation requirements, resulting from the Cameroon Money Laundering Act in particular, may apply.'),

                headingThree('Clarity of Orders and Credit Transfers'),
                description(
                    'Orders must unequivocally show their contents. Orders that are not worded clearly may lead to queries, which may result in delays. In particular, when giving orders, the Customer must ensure that the information the Customer provides, particulary the domestic account number and bank code number  or IBAN[2] and BIC[3] and the currency, are complete and correct. Amendments, conﬁrmations or repetitions of orders must be designated as such.'),

                headingThree(
                    'Special Reference to Urgency in Connection with the Execution of an Order or a Credit Transfer'),
                description(
                    'If the Customer feels that an order requires particularly prompt execution, the Customer shall notify the Bank of this fact separately. For orders issued on a printed form, this must be done separately from the form.'),

                headingThree(
                    'Examination of, and Objections to, Notiﬁcation Received from the Bank'),
                description(
                    'The Customer must immediately examine account statements, securities contract notes, statements  of securities holdings and earnings, other statements, advices of execution of orders and credit transfers as well as information on expected payments and consignments (advices), as to their correctness and completeness and immediately raise any objections relating thereto.'),

                headingThree(
                    'Notice to the Bank in Case of Non-Receipt of Statements'),
                description(
                    'The Customer must notify the Bank immediately if periodic balance statements and statements of securities holdings are not received. The duty to notify the Bank also exists if other advices expected by the Customer are not received (e.g. securities contract notes, account statements after execution of  Customer  orders  or regarding payments expected by the Customer).'),

                headingText('Cost of Bank Services'),

                headingTwo('Interest, Charges and Expenses'),

                headingThree('Interest and Charges in Business with Consumers'),
                description(
                    'The amount of interest and charges for the customary services '
                    'which the Bank provides to consumers, including the amount of any '
                    'payments in addition to the remuneration agreed for the principal '
                    'service, is set out in the “Price Display – Standard rates for private'
                    ' banking and the “List of Prices and Services”. If a Customer makes use '
                    'of a service included therein, and unless otherwise agreed between '
                    'the Bank and the Customer, the interest and charges stated in the'
                    ' then valid Price Display or List of Prices and Services are applicable. '
                    'Any agreement that concerns a payment made by the consumer in addition '
                    'to the remuneration agreed for the principal service must be expressly '
                    'concluded by the Bank with the consumer, even if such payment is stated'
                    'in the Price Display or the List of Prices and Services. '
                    '\n\nUnless otherwise agreed, the charges for any services not '
                    'included in the Price Display or the List of Prices and Services '
                    'which are provided following the instructions of the Customer'
                    ' and which can, in the given circumstances, only be expected '
                    'to be provided against remuneration, shall be governed by the '
                    'relevant statutory provisions.'),

                headingThree(
                    'Interest and Charges in Business with Customers who are not Consumers'),
                description(
                    'The amount of interest and charges for the customary banking services which the Bank provides to Customers who are not consumers is set out in the “Price Display – Standard rates for private banking” and the “List of Prices and Services”, provided that the Price Display and the List of Prices and Services include customary banking services to Customers who are not consumers (e.g. business Customers). If a Customer who is not a consumer makes use of a service included therein, and unless otherwise agreed between the Bank and the Customer, the interest and charges stated in the then valid Price Display or List of Prices and Services are applicable. Otherwise, in the absence of any other agreement or conﬂict with statutory provisions, the Bank shall determine the amount of interest and charges at its reasonable discretion (Section 315 of the Cameroon Civil Code).'),

                headingThree('Non-Chargeable Service'),
                description(
                    'The Bank shall not charge for any service which it is required to provide by law or pursuant to a contractual accessory obligation or which it performs in its own interest, unless such charge is legally permissible and levied in accordance with the relevant statutory provisions.'),

                headingThree(
                    'Changes in Interest Rates; Right of Termination by the Customer in the Event of an Increase'),
                description(
                    'In the case of variable interest rate loans, the interest rate shall be adjusted in accordance with the terms of the respective loan agreement. The Bank shall notify the Customer of any interest rate adjustments. If the interest rate is increased, the Customer may, unless otherwise agreed, terminate the loan agreement aﬀected thereby with immediate eﬀect within six weeks from notiﬁcation of the change. If the Customer terminates the loan agreement, any such increased interest rate shall not be applied to the terminated loan agreement. The Bank shall allow a reasonable period of time for settlement.'),

                headingThree(
                    'Changes in Charges for Services Typically Used on a Permanent Basis'),
                description(
                    'Changes in charges for banking services which are typically used '
                    'by Customers within the framework of the business relationship  '
                    'on a permanent basis (e.g. account/securities account management) '
                    'shall be oﬀered to the Customer in text form prior to their proposed '
                    'date of entry into force. If the Customer has agreed to an electronic '
                    'communication channel (e.g. eBanking) with the Bank within the '
                    'framework of the business relationship, the changes may also be '
                    'oﬀered through this channel. The changes shall only become eﬀective '
                    'upon the Customer’s consent. '
                    '\nAny agreement on the adjustment of a charge that concerns a payment '
                    'made by the consumer in addition to the remuneration agreed for '
                    'the principal service must be expressly concluded by the Bank '
                    'with the consumer.'),

                headingThree('Reimbursement of Expenses'),
                description(
                    'Any entitlement by the Bank to reimbursement of expenses shall be governed by the applicable statutory provisions.'),

                headingThree(
                    'Special Arrangements for Consumer Loan Agreements and Payment Services Contracts with Consumers for Payments within the CEMAC Zone'),
                description(
                    'The interest and costs (charges, out-of-pocket expenses) for consumer loan agreements and payment services contracts with consumers for payments within the CEMAC Zone shall  be determined by the relevant contractual arrangements and Special Conditions as well as the additional statutory provisions.'),

                headingTwo('Providing or Increasing Security'),

                headingThree('Right of the Bank to Request Security'),
                description(
                    'The Bank may demand that the Customer provide the usual forms of security for any claims that may arise from the banking relationship, even if such claims are conditional (e.g. indemnity for amounts paid under a guarantee issued on behalf of the Customer). If the Customer has assumed a liability for another Customer’s obligations towards the Bank (e.g. as a surety), the Bank is, however, not entitled to demand that security be provided or increased for the debt resulting from such liability incurred before the maturity of the debt.'),

                headingThree('Changes in the Risk'),
                description(
                    'If the Bank, upon the creation of claims against the Customer, '
                    'has initially dispensed wholly or partly with demanding that'
                    ' security be provided or increased, it may nonetheless make such a '
                    'demand at a later time, provided, however, that circumstances occur '
                    'or become known which justify a higher risk assessment of the claims '
                    'against the Customer. This may, in particular, be the case if – the '
                    'economic status of the Customer has changed or threatens to change '
                    'in a negative manner or – the value of the existing security has '
                    'deteriorated or threatens to deteriorate. '
                    '\nThe Bank has no right to  demand security if it has been expressly '
                    'agreed that the Customer either does not have to provide any security '
                    'or must only provide that security which has been speciﬁed. For '
                    'consumer loan agreements, the Bank is entitled to demand that '
                    'security be provided or increased only to the extent that such '
                    'security is mentioned in the loan agreement; when, however, the '
                    'net loan amount exceeds EUR 75,000, the Bank may demand that '
                    'security be provided or increased even if the loan agreement does '
                    'not contain any or any exhaustive indications as to security.'),

                headingThree(
                    'Setting a Period of Time for Providing or Increasing Security'),
                description(
                    'The Bank shall allow a reasonable period of time for providing or increasing security. If the Bank intends to make use of its right of termination without notice should the Customer fail to comply with the obligation to provide or increase security within such period, it shall draw the Customer’s attention to this consequence before doing so.'),

                headingTwo('Lien in Favour of the Bank'),

                headingThree('Agreement on the Lien'),
                description(
                    'The Customer and the Bank agree that the Bank acquires a lien on the securities and chattels which, within the scope of banking business, have come or may come into the possession of a domestic oﬃce of the Bank. The Bank also acquires a lien on any claims which the Customer has or may in future have against the Bank arising from the banking relationship (e.g. credit balances).'),

                headingThree('Secured Claims'),
                description(
                    'The lien serves to secure all existing, future and contingent claims arising from the banking relationship which the Bank with all its domestic and foreign oﬃces is entitled to against the Customer. If the Customer has assumed liability for another Customer’s obligations towards the Bank (e.g. as a surety), the lien shall not secure the debt resulting from the liability incurred before the maturity of the debt.'),

                headingThree(
                    'Earmarked Funds and Assets of the Customer, Own Securities and Securities Held in Foreign Countries'),
                description(
                    'If funds or other assets come into the power of disposal of the Bank under the reserve that they may only be used for a speciﬁed purpose (e.g. deposit of cash for payment of a bill of exchange), the Bank’s lien does not extend to these assets. The same applies to shares issued by the Bank itself (own shares) and to securities which the Bank keeps in custody abroad for the Customer’s account. Moreover, the lien extends neither to the proﬁt-participation rights/proﬁt-participation certiﬁcates issued by  the  Bank itself nor to the Bank’s securitised and non‑securitised subordinated liabilities.'),

                headingThree('Interest and Dividend Coupons'),
                description(
                    'If securities are subject to the Bank’s lien, the Customer is not entitled to demand the delivery of the interest and dividend coupons pertaining to such securities.'),

                headingTwo(
                    'Security Interests in the Case of Items for Collection and Discounted Bills of Exchange'),

                headingThree('Transfer of Ownership by Way of Security'),
                description(
                    'The claims underlying the cheques and bills of exchange shall pass to the Bank simultaneously with the acquisition of ownership in the cheques and bills of exchange; the claims also pass to the Bank if other items are deposited for collection (e.g. direct debits, documents of commercial trading).'),

                headingThree('Assignment by Way of Security'),
                description('The claims underlying the cheques and bills of exchange shall pass to the Bank simultaneously with the acquisition of ownership in the cheques and bills of exchange; the claims also pass to the Bank if other items are deposited for collection (e.g. direct debits, documents of commercial trading).'),

                headingThree('Special-Purpose Items for Collection'),
                description('If items for collection are deposited with the Bank under the reserve that their countervalue may only be used for a speciﬁed purpose, the transfer or assignment of ownership by way of security does not extend to these items.'),

                headingThree('Secured Claims of the Bank'),
                description('The ownership transferred or assigned by way of security serves to secure any claims which the Bank may be entitled to against the Customer arising from the Customer’s current account when items are deposited for collection or arising as a consequence of the redebiting of unpaid items for collection or discounted bills of exchange. Upon request of the Customer, the  Bank retransfers to the Customer the ownership by way of security of such items and of the claims that have passed to it if it does not, at the time of such request, have any claims against the Customer that need to be secured or if it does not permit the Customer to dispose of the countervalue of such items prior to their ﬁnal payment.'),

                headingTwo('Limitation of the Claim to Security and Obligation to Release'),

                headingThree('Cover Limit'),
                description('The Bank may demand that security be provided or increased until the realisable value of all security corresponds to the total amount of all claims arising from the banking business relationship (cover limit).'),

                headingThree('Release'),
                description('If the realisable value of all security exceeds the cover limit on a more than temporary basis, the Bank shall, at the Customer’s request, release security items as it may choose in the amount exceeding the cover limit; when selecting the security items to be released, the Bank shall take into account the legitimate concerns of the Customer or of any third party having provided security for the Customer’s obligations. To this extent, the Bank is also obliged to execute orders of the Customer relating to the items subject to the lien (e.g. sale of securities, repayment of savings deposits).'),

                headingThree('Special Agreements'),
                description('If assessment criteria for a speciﬁc security  item  other  than the realisable value or another cover limit or another limit for the release of security have been agreed, these other criteria or limits shall apply.'),

                headingTwo('Realisation of Security'),

                headingThree('Option of the Bank'),
                description('If the Bank realises security, it may choose between several security items. When realising security and selecting the items to be realised, the Bank shall take into account the legitimate concerns of the Customer and any third party who may have provided security for the obligations of the Customer.'),

                headingThree('Credit Entry for Proceeds under Turnover Tax Law'),
                description('If the transaction of realisation is subject to  turnover  tax,  the Bank shall provide the Customer with a credit entry for the proceeds, such entry being deemed to serve as invoice for the supply of the item given as security and meeting the requirements of turnover tax law.'),

                headingText('Termination'),

                headingTwo('Termination Rights of the Customer'),

                headingThree('Right of Termination at Any Time'),
                description('Unless the Bank and the Customer have agreed a term or a diverging termination provision, the Customer may at any time, without notice, terminate the business relationship as a whole or particular business relations (e.g. a chequing agreement).'),

                headingThree('Termination for Reasonable Cause'),
                description('If the Bank and the Customer have agreed a term or a diverging termination provision for a particular business relation, such relation may only be terminated without notice if there is reasonable cause therefor which makes it unacceptable to the Customer to continue it, also after giving consideration to the legitimate concerns of the Bank.'),

                headingThree('Statutory Termination Rights'),
                description('Statutory termination rights shall not be aﬀected'),

                headingTwo('Termination Rights of the Bank'),

                headingThree('Termination upon Notice'),
                description('Upon observing a reasonable period of notice, the Bank may at any time terminate the business relationship as a whole or particular business relations for which neither a term nor a diverging termination provision has been agreed (e.g. the chequing agreement authorizing the use of cheque forms). In determining the period of notice, the Bank shall take into account the legitimate concerns of the Customer. The minimum termination notice for a payment services framework contract (e.g. current account or card contract) and a securities account shall be two months.'),

                headingThree('Termination of Loans with no Fixed Term'),
                description('Loans and loan commitments for which neither a ﬁxed term nor a diverging termination provision has been agreed may be terminated at any time by the Bank without notice. When exercising this right of termination, the Bank shall give due consideration to the legitimate concerns of the Customer. '
                    'Where the Cameroon Civil Code contains speciﬁc provisions for the '
                    'termination of a consumer loan agreement, the Bank may only terminate '
                    'the agreement as provided therein.'),

                headingThree('Termination for Reasonable Cause without Notice'),
                description('Termination of the business relationship as a whole or of '
                    'particular business relations without  notice  is permitted if '
                    'there is reasonable cause which makes it unacceptable to the '
                    'Bank to continue the business relations, also after having given '
                    'consideration to the legitimate concerns of the Customer. '
                    'Reasonable cause is given in particular if the Customer has made incorrect '
                    'statements as to the Customer’s ﬁnancial status, provided such '
                    'statements were of signiﬁcant importance for the Bank’s decision '
                    'concerning the granting of credit or other operations involving '
                    'risks for the Bank (e.g. the delivery of a payment card), or '
                    'if a substantial deterioration in the Customer’s ﬁnancial '
                    'status or in the value of security occurs or threatens to occur, '
                    'jeopardizing the repayment of a loan or the discharge of any other '
                    'obligation towards the Bank even if security provided therefor '
                    'is realised, or if the Customer fails to comply, within the '
                    'required period of time allowed by the Bank, with the obligation '
                    'to provide or increase security according to No. 13 (2) of these '
                    'Business Conditions or to the provisions of some other agreement. '
                    'If reasonable cause is given due to the breach of a contractual '
                    'obligation, termination shall only be permitted after expiry, '
                    'without result, of a reasonable period of time ﬁxed for '
                    'corrective action by the Customer or after a warning to the '
                    'Customer has proved unsuccessful, unless this proviso can be '
                    'dispensed with owing to the special features of a particular'
                    ' case (Section 323 (2) and (3) of the Cameroon Civil Code).'),

                headingThree('Termination of Consumer Loan Agreements in the Event of Default'),
                description('Where the Cameroon Civil Code contains speciﬁc provisions for the termination of a consumer loan agreement subsequent to repayment default, the Bank may only terminate the agreement as provided therein.'),

                headingThree('Settlement Following Termination'),
                description('In the event of termination without notice, the Bank shall allow the Customer a reasonable period of time for settlement (in particular for the repayment of a loan), unless it is necessary to attend immediately thereto (e.g. the return of cheque forms following termination of a chequing agreement).'),

                SizedBox(height: 24.0,),

                headingText('Protection of Deposits'),

                headingTwo('Deposit Protection Fund'),

                description('Your deposit is in our bank account in united bank for Africa. If insolvency of your credit institution should occur, your deposits would in any case be repaid up to fcfa 50,000,000.'),

                description('\n\n\nIf a deposit is unavailable because a credit institution is unable to meet its ﬁnancial obligations, depositors are repaid by a Deposit Guarantee Scheme. This repayment covers at maximum fcfa 50,000,000 per credit institution. This means that all deposits at the same  credit  institution are added up in order to determine the coverage level. If, for instance, a depositor holds a savings account with fcfa 40,000,000 and a current account with fcfa 10,000,000, he or she will only be repaid fcfa 50,000,000.'),

                description('\n\n\nIn case of joint accounts, the limit of fcfa 50,000,000 applies to each depositor. Deposits in an account to which two or more persons are entitled as members of a business partnership, association or grouping of a similar nature, without legal personality, are aggregated and treated as if made by a single depositor for the purpose of calculating the limit of fcfa 50,000,000. In the cases listed in Section 8 (2) to (4) of the Cameroon Deposit Guarantee Act deposits are protected above fcfa 50,000,000.'),

                description('\n\n\nIf you have not  been repaid within these deadlines, you should contact the Deposit Guarantee Scheme since the time to claim reimbursement may be barred after a certain time limit. '),

                description('\n\n\nIn general, all retail depositors and businesses are covered by Deposit Guarantee Schemes. Exceptions for certain deposits are stated on the website of the responsible Deposit Guarantee Scheme. Your credit institution will also inform you on request whether certain products are covered or not. If deposits are covered, the credit institution shall also conﬁrm this on the statement of account.'),

                SizedBox(height: 24.0),

                headingText('Complaints'),

                headingTwo('Possibilities of Filing Complaints'),

                description('The customer has the following out-of-court possibilities to ﬁle '
                    'a complaint: '
                    '\n\n⦁	The Customer may contact the Bank under the contact details '
                    'indicated in the “List of Prices and Services”. The Bank will '
                    'answer Complaints in a suitable way. In the case of payment '
                    'services agreements this means in text format (e.g. via letter, '
                    'or e-mail). '
                    '\n⦁	Expose BanQ is obliged to take part in a dispute '
                    'settlement procedure before a consumer dispute arbitration board.'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget headingText(texts) => Text(
        texts,
        style: poppinsSemiBold.copyWith(
          fontSize: 20.0,
          color: AppColors.whiteColor,
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
              height: 8.0,
              width: 8.0,
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
                  fontSize: 16.0,
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

  Widget description(texts) => Text(
        texts,
        style: poppinsLight.copyWith(
          fontSize: 12.0,
          color: AppColors.whiteColor,
          height: 1.7,
        ),
      );
}
