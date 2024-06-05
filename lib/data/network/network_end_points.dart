class NetworkEndPoints {
  static String baseUrl = 'https://thunder-api-dev.azurewebsites.net/api';
  static String signIn = '$baseUrl/agent/signIn';
  static String signInV2 = '$baseUrl/agent/signInV2';
  static String getAgentInfo = '$baseUrl/agent/getAgentInfo?agentId={agentId}';
  static String forgotPassword = '$baseUrl/agent/forgotPassword';
  static String registerInterestSignUp = '$baseUrl/users/register-interest';
  static String verifyOtp = '$baseUrl/agent/verifyOtp';
  static String registerInterestVerifyOtp = '$baseUrl/users/verify-otp';
  static String getInvoices =
      '$baseUrl/invoices/getInvoicesAgent?agentId={agentId}';
  static String getTransactions =
      '$baseUrl/transactions/getAgentTransactions?status=completed&agentId={agentId}';
  static String createInvoice = '$baseUrl/invoices/createAndSend';
  static String getAgentStats =
      '$baseUrl/transactions/agentStats?startDate={startDate}&endDate={endDate}&agentId={agentId}';
  static String crateTransactionPaymentLink =
      '$baseUrl/transactions/createTransactionByPaymentLink?uuid={uuid}';
  static String cratePaymentLink =
      '$baseUrl/paymentLinks/create?agentId={agentId}';
  static String getAgentPaymentLinkDetails =
      '$baseUrl/paymentLinks/agentPaymentLinkDetails?uuid={uuid}';
  static String createTransactionByPaymentLink =
      '$baseUrl/transactions/createTransactionByPaymentLink?uuid={uuid}';
  static String getAgentPaymentLinkTransactions =
      '$baseUrl/transactions/getAgentPaymentLinkTransactions?agentId={agentId}&status=completed';
  static String getAgentInvoiceTransactions =
      '$baseUrl/transactions/getAgentInvoiceTransactions?agentId={agentId}&status=completed';
  static String resetPassword = '$baseUrl/agent/resetPassword';
  static String allPaymentLinks =
      '$baseUrl/transactions/getAgentPaymentLinkTransactions?agentId={agentId}&status=completed';
  static String sharePaymentUrlBase =
      'https://thunder-web-dev.azurewebsites.net/';
}
