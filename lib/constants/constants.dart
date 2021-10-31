import 'package:intl/intl.dart';

//Portfolio
var kPortfolio = [
  {
    'symbol': 'AAPL',
    'name': 'APPLE, INC.',
    'totalQuantity': 20.0,
    'equityValue': 2500.0,
    'pricePerShare': 125.0,
    'image': 'assets/aapl.png'
  },
  {
    'symbol': 'TSLA',
    'name': 'TESLA, INC.',
    'totalQuantity': 5.0,
    'equityValue': 3000.0,
    'pricePerShare': 600.0,
    'image': 'assets/tsla.png'
  },
  {
    'symbol': 'AMZN',
    'name': 'AMAZON.COM INC.',
    'totalQuantity': 30.0,
    'equityValue': 4500.0,
    'pricePerShare': 150.0,
    'image': 'assets/amzn.png'
  },
  {
    'symbol': 'NFLX',
    'name': 'NETFLIX, INC.',
    'totalQuantity': 5.0,
    'equityValue': 3250.0,
    'pricePerShare': 650.0,
    'image': 'assets/nflx.png'
  },
  {
    'symbol': 'GSK',
    'name': 'GLAXOSMITHKLINE PLC',
    'totalQuantity': 10.0,
    'equityValue': 420.0,
    'pricePerShare': 42.0,
    'image': 'assets/gsk.jpg'
  },
  {
    'symbol': 'ADBE',
    'name': 'ADOBE SYSTEMS INC.',
    'totalQuantity': 3.0,
    'equityValue': 1920.0,
    'pricePerShare': 640.0,
    'image': 'assets/adbe.png'
  },
  {
    'symbol': 'FBNH',
    'name': 'FIRST BANK OF NIGERIA PLC',
    'totalQuantity': 20.0,
    'equityValue': 240.0,
    'pricePerShare': 12.0,
    'image': 'assets/fbnh.png'
  },
  {
    'symbol': 'JMIA',
    'name': 'JUMIA TECHNOLOGIES AG',
    'totalQuantity': 15.0,
    'equityValue': 270.0,
    'pricePerShare': 18.0,
    'image': 'assets/jmia.jpg'
  },
];

//Formatting
final dateFormatter = DateFormat('MMMM d, y');

//Strings
const String kAuthenticated = 'isAuthenticated';
const String kEmail = 'email';
const String kPassword = 'password';
const String kPhoneNumber = 'phoneNumber';
const String kWalletBalance = 'walletBalance';
const String kLoanAmount = 'loanAmount';
const String kLoanPeriod = 'loanPeriod';
const String kLoanSchedule= 'loanSchedule';
const String kAmountLeft = 'amountLeft';

RegExp emailRegEx = RegExp(
    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
