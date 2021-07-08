package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import jp.pokepay.pokepay_sdk.PokepaySdkPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    PokepaySdkPlugin.registerWith(registry.registrarFor("jp.pokepay.pokepay_sdk.PokepaySdkPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
