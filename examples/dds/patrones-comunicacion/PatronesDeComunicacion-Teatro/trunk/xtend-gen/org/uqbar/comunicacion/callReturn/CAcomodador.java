package org.uqbar.comunicacion.callReturn;

import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.uqbar.comunicacion.sharedMemory.shared.SAsiento;

@SuppressWarnings("all")
public class CAcomodador {
  public static SAsiento reservar(final List<SAsiento> asientos) {
    final Function1<SAsiento,Boolean> _function = new Function1<SAsiento,Boolean>() {
        public Boolean apply(final SAsiento unAsiento) {
          boolean _isEstaOcupado = unAsiento.isEstaOcupado();
          boolean _not = (!_isEstaOcupado);
          return Boolean.valueOf(_not);
        }
      };
    final SAsiento asientoLibre = IterableExtensions.<SAsiento>findFirst(asientos, _function);
    asientoLibre.setEstaOcupado(true);
    return asientoLibre;
  }
  
  public static void cancelar(final List<SAsiento> asientos, final SAsiento aCancelar) {
    aCancelar.setEstaOcupado(false);
  }
}
