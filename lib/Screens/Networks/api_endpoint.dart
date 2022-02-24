const urlBase = 'http://35.153.234.228/groceryboo/api'; //Base Url (4-2-22)
// const urlBase = 'http://3.237.174.237/groceryboo/api'; //Base Url (18-1-22)

//Authentication APIs
const urlGetLogin = '/common/mobile/login';
const urlPostRegister = '/common/mobile/register';
const urlPostRegisterStep1 = '/common/mobile/register/step-first';
const urlPostEmailVerification = '/common/mobile/email/varification';
const urlPostRegisterStep2 = '/common/mobile/register/step-two';
const urlPostPhoneVerification = '/common/mobile/phone/varification';
const urlPostResendCode = '/common/mobile/email/resend-code';
const urlPostResendOtp = '/common/mobile/phone/resend-otp';
const urlPostCountryList = '/common/country-list';
const urlPostSocialLogin = '/common/mobile/social-login';
const urlPostCityList = '/common/city-list';

//Forgot password flow
const urlForgotPassword= '/common/mobile/forgot-password';
const urlVerifiedOtp = '/common/mobile/verify-otp';
const urlResendOtp = '/common/mobile/resend-otp';
const urlResetPassword = '/common/mobile/reset-password';

//Address APIs
const urlAddressCreate = '/user/address/create';
const urlAddressesList = '/user/address/list';
const urlAddressDelete = '/user/address/delete';
const urlAddressEdit = '/user/address/edit';

//This API is called when token got expired
const urlAutoLogin = '/common/mobile/auto-login';

// Profile Edit API
const urlPostEditProfile = '/user/edit-profile';
const urlPostEditUserProfile = '/user/edit-profile';
const urlPostChangePassword = '/vendor/change-password';

//Follow & unfollow API
const urlPostFollowingList = '/user/following-list';
const urlPostFollowerList = '/user/follower-list';
const urlPostFollowUser = '/user/follow-user';
const urlPostUnfollowUser = '/user/unfollow-user';
const urlPostReportUser = '/user/user-report';

// Display User profile
const urlPostUserProfile = '/user/user-profile';

//Category APIs
const urlcategoryList = '/user/category/list';

//ProductList APIs
const urlproductList = '/user/product/list';

//Add To Cart APIs
const urladdToCart = '/user/basket/add-item';

//ProductList APIs
const urlSingleproduct = '/user/product/details';

//Collection APIs
const userCollectionList = '/user/usercollection/list'  ;
const createCollection = '/user/usercollection/create'  ;

//BasketList APIs
const urlBasketList = '/user/basket/item-list';

//RemoveBasketItem APIs
const urlRemovebasketItem = '/user/basket/remove-item';


//OnGoingOrder APIs
const urlOngoingOrders = '/user/ongoing/orders';

//pastOder APIs
const urlPastOrders = '/user/past/orders';

//orderDetails APIs
const urlOrderDetails= '/user/order/details';

//Pinned APIs
const pinnedList = '/user/pinned/list'  ;
const pinnedDetails = '/user/pinned/details'  ;

//orderDetails APIs
const urladdressList= '/user/address/list';

//wallet APIs
const urlWalletDetails = '/user/user-wallet';
// Pin Created  API
const urlPinnedCreated = '/user/pinned/create';

// OrderPlaced API
const urlOrderPlaced = '/user/order/place';

// RecommendedPinnedList API
const urlRecommendedPinnedList= '/user/pinned/list';


// RecommendedPinnedList API
const urlPinnedDetails= '/user/pinned/details';


//withdraw APIs
const urlRecentWithdraw = '/user/recent-withdraw';
const urlAddAccount = '/vendor/bank-details';
const urlSelectAccount = '/vendor/get-bank-details';
