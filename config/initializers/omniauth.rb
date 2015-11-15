Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "PYFiAKoLo5LAw7QinhxbFNiTb", "kBlgOkVukoSYprkCRwHNSmafBM32tv8kPqreEEYdZf4kj9Mx0y"
  provider :facebook, '1689219541323576', '2e6547729e7dfc9b69a0137acc92e7c2'
end