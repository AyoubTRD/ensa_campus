import 'package:ensa_campus/features/auth/data/remote/supabase_user_data_source.dart';
import 'package:ensa_campus/features/auth/domain/repositories/auth_repository.dart';
import 'package:ensa_campus/features/auth/domain/repositories/implementations/supabase_auth_repository.dart';
import 'package:ensa_campus/features/shared/data/user_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt sl = GetIt.instance;

void setupDI() {
  // Clients
  sl.registerSingleton<SupabaseClient>(Supabase.instance.client);

  // Shared data sources
  sl.registerSingleton<UserDataSource>(SupabaseUserDataSource(sl()));

  // Authentication
  sl.registerSingleton<AuthRepository>(SupabaseAuthRepository(client: sl()));
}
