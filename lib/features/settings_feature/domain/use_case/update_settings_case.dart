import 'package:dartz/dartz.dart';
import 'package:shop_admin/core/constants/failures.dart';
import 'package:shop_admin/features/settings_feature/domain/use_case/settings_use_case.dart';

import '../../data/model/settings_model.dart';
import '../repository/repository.dart';

class UpdateSettingsCase extends SettingsUseCase<SettingsModel,ParamUpdateSettings>{

  final SettingsRepository repository;
  UpdateSettingsCase(this.repository);

  @override
  Future<Either<Failure, SettingsModel>> call(ParamUpdateSettings param)async{
    return await repository.updateSettings(param.data);
  }
}



class ParamUpdateSettings{
  final double kilometerPrice;
  final int topSellingLimit;
  final int offerLimit;
  final double deliveryKilometerEarning;
  final double deliveryReward;
  final int ordersRewardNumber;
  final double shopLat;
  final double shopLong;
  final int increasingDeliveryAcceptingPercent;
  final int orderNumberIncreasingAcceptePercent;
  ParamUpdateSettings(this.kilometerPrice, this.topSellingLimit, this.offerLimit, this.deliveryKilometerEarning, this.deliveryReward, this.ordersRewardNumber, this.shopLat, this.shopLong, this.increasingDeliveryAcceptingPercent, this.orderNumberIncreasingAcceptePercent);
  Map<String,dynamic>get data{
    return {
   'kilometer_price':kilometerPrice.toString(),
   'top_selling_limit':topSellingLimit.toString(),
    'offer_limit':offerLimit.toString(),
  'delivery_kilometer_earning':deliveryKilometerEarning.toString(),
    'delivery_reward':deliveryReward.toString(),
    'orders_reward_number':ordersRewardNumber.toString(),
   'shop_lat':shopLat.toString(),
   'shop_long':shopLong.toString(),
    'inccreasing_delivery_accepting_percent':increasingDeliveryAcceptingPercent.toString(),
  'order_number_increasing_accepte_percent':orderNumberIncreasingAcceptePercent.toString()
    };
  }


}