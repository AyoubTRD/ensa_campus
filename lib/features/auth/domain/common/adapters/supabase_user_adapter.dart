import 'package:ensa_campus/features/auth/domain/entities/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class SupabaseUserAdapter extends UserEntity {
  SupabaseUserAdapter(supabase.User supabaseUser)
      : super(
          id: supabaseUser.id,
          email: supabaseUser.email!,
        );
}
