import 'failures.dart';



String errorMsgg( Failure errorType,String errorMsg){
  if(errorType is ServerFailure){
    return "server failure, please try again later";
  }
  else if(errorType is ConnectionFailure){
    return "no internet connection";
  }
  return errorMsg;
}

String errorMsg( Failure errorType){
  if(errorType is ServerFailure){
    return "server failure, please try again later";
  }
  else if(errorType is ConnectionFailure){
    return "no internet connection";
  }
  else if(errorType is BackendFailure){
    return errorType.errorMsg!;
  }
  return "";
}

convertIntoPaymentMethode(val){
  return val==0?"Cache":"Electronic";
}

convertIntoOrderType(val){
  return val==0?"Delivery":"Receive";
}
convertIntoDeliveryBanned(val){
  return val==0?"No":"Yes";
}
convertIntoDeliveryStage(val){
  if(val==0){
   return "To Shop";
  }else if(val==1){
    return "In Shop";
  }
  return "To Customer";
}

convertIntoDeliveryStatus(val){
  if(val==-2){
    return "Banned";
  }else if(val==-1){
    return "Offline";
  }else if(val==0){
    return "Online";
  }
  return "Active";
}
convertIntoDeliveryApprove(val){
  return val==0?"NO":"Yes";
}
