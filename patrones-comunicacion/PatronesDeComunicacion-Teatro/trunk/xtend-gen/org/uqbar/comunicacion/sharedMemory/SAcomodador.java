package org.uqbar.comunicacion.sharedMemory;

import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.uqbar.comunicacion.sharedMemory.shared.SAsiento;
import org.uqbar.comunicacion.sharedMemory.shared.SFuncion;

@SuppressWarnings("all")
public class SAcomodador {
  public static void reservar() {
    SFuncion _instance = SFuncion.getInstance();
    List<SAsiento> _asientos = _instance.getAsientos();
    final Function1<SAsiento,Boolean> _function = new Function1<SAsiento,Boolean>() {
        public Boolean apply(final SAsiento unAsiento) {
          boolean _isEstaOcupado = unAsiento.isEstaOcupado();
          boolean _not = (!_isEstaOcupado);
          return Boolean.valueOf(_not);
        }
      };
    final SAsiento asientoLibre = IterableExtensions.<SAsiento>findFirst(_asientos, _function);
    asientoLibre.setEstaOcupado(true);
    SFuncion _instance_1 = SFuncion.getInstance();
    _instance_1.setUltimoAsientoReservado(asientoLibre);
  }
  
  public static void cancelar() {
    SFuncion _instance = SFuncion.getInstance();
    SAsiento _asientoACancelar = _instance.getAsientoACancelar();
    _asientoACancelar.setEstaOcupado(false);
  }
}
