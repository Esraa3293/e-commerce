abstract class PaymentStates {}

class PaymentInitState extends PaymentStates {}

class AuthTokenLoadingState extends PaymentStates {}

class AuthTokenSuccessState extends PaymentStates {}

class AuthTokenErrorState extends PaymentStates {}

class OrderIdLoadingState extends PaymentStates {}

class OrderIdSuccessState extends PaymentStates {}

class OrderIdErrorState extends PaymentStates {}

class RequestTokenCardLoadingState extends PaymentStates {}

class RequestTokenCardSuccessState extends PaymentStates {}

class RequestTokenCardErrorState extends PaymentStates {}

class RequestTokenKioskLoadingState extends PaymentStates {}

class RequestTokenKioskSuccessState extends PaymentStates {}

class RequestTokenKioskErrorState extends PaymentStates {}

class RefCodeLoadingState extends PaymentStates {}

class RefCodeSuccessState extends PaymentStates {}

class RefCodeErrorState extends PaymentStates {}
