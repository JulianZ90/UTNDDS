package org.uqbar.comunicacion.callReturn;

import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.uqbar.comunicacion.callReturn.CAcomodador;
import org.uqbar.comunicacion.sharedMemory.shared.SAsiento;

@SuppressWarnings("all")
public class AcomodadorCallReturnTest {
  private List<SAsiento> asientos;
  
  @Before
  public void setUp() {
    ArrayList<SAsiento> _arrayList = new ArrayList<SAsiento>();
    this.asientos = _arrayList;
    IntegerRange _upTo = new IntegerRange(1, 100);
    final Procedure1<Integer> _function = new Procedure1<Integer>() {
        public void apply(final Integer i) {
          SAsiento _libre = SAsiento.libre();
          AcomodadorCallReturnTest.this.asientos.add(_libre);
        }
      };
    IterableExtensions.<Integer>forEach(_upTo, _function);
  }
  
  @Test
  public void testReservarUnAsiento() {
    final Procedure1<SAsiento> _function = new Procedure1<SAsiento>() {
        public void apply(final SAsiento unAsiento) {
          boolean _isEstaOcupado = unAsiento.isEstaOcupado();
          Assert.assertFalse(_isEstaOcupado);
        }
      };
    IterableExtensions.<SAsiento>forEach(this.asientos, _function);
    SAsiento asiento = CAcomodador.reservar(this.asientos);
    boolean _isEstaOcupado = asiento.isEstaOcupado();
    Assert.assertTrue(_isEstaOcupado);
  }
  
  @Test
  public void testCancelarAsientoReservado() {
    final Procedure1<SAsiento> _function = new Procedure1<SAsiento>() {
        public void apply(final SAsiento unAsiento) {
          boolean _isEstaOcupado = unAsiento.isEstaOcupado();
          Assert.assertFalse(_isEstaOcupado);
        }
      };
    IterableExtensions.<SAsiento>forEach(this.asientos, _function);
    SAsiento asiento = CAcomodador.reservar(this.asientos);
    boolean _isEstaOcupado = asiento.isEstaOcupado();
    Assert.assertTrue(_isEstaOcupado);
    CAcomodador.cancelar(this.asientos, asiento);
    boolean _isEstaOcupado_1 = asiento.isEstaOcupado();
    Assert.assertFalse(_isEstaOcupado_1);
    final Procedure1<SAsiento> _function_1 = new Procedure1<SAsiento>() {
        public void apply(final SAsiento unAsiento) {
          boolean _isEstaOcupado = unAsiento.isEstaOcupado();
          Assert.assertFalse(_isEstaOcupado);
        }
      };
    IterableExtensions.<SAsiento>forEach(this.asientos, _function_1);
  }
}
