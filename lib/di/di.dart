import 'package:ensa_campus/features/auth/domain/repositories/auth_repository.dart';
import 'package:ensa_campus/features/auth/domain/repositories/implementations/supabase_auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt sl = GetIt.instance;

void setupDI() {
  // Authentication using Supabase
  sl.registerSingleton<SupabaseClient>(Supabase.instance.client);
  sl.registerSingleton<AuthRepository>(SupabaseAuthRepository(client: sl()));
}
