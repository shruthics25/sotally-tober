class AppState {
    
    final Map userDetails;
    final String error;
    final bool isLoading;
    final String apiUrl;
    final bool isLogin;

    AppState({this.userDetails,this.error,this.isLoading,this.apiUrl,this.isLogin});

    AppState.initialState() : 
    userDetails = {},
    isLoading = false,
    isLogin = false,
    error = "",
    apiUrl = "";
    
    AppState copyWith({Map userDetails, String error , bool isLoading,String apiUrl}){
      return AppState(
        userDetails: userDetails ?? this.userDetails,
        error: error ?? this.error,
        isLoading: isLoading ?? this.isLoading,
        isLogin : isLogin ?? this.isLogin,
        apiUrl: apiUrl ?? this.apiUrl
      );
    }

    static AppState fromJSON(dynamic json) {
    if (json == null) {
      return AppState.initialState();
    }
    return AppState(
      userDetails: json['userDetails'] as Map,
      isLoading: json['isLoading'] as bool,
      isLogin: json['isLogin'] as bool,
      error: json['error'] as String,
      apiUrl: json['apiUrl'] as String
    );
  }

  dynamic toJson() => {
    'userDetails': {},
    'isLoading': false,
    'isLogin':false,
    'error': "",
    'apiUrl':""
  };
  
  @override
    String toString() {
      return toJson().toString();
  }


    

}