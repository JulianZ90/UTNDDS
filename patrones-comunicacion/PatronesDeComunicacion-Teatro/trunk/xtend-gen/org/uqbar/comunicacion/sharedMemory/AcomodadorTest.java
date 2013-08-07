package org.uqbar.comunicacion.sharedMemory;

import org.junit.Assert;
import org.junit.Test;
import org.uqbar.comunicacion.sharedMemory.SAcomodador;
import org.uqbar.comunicacion.sharedMemory.shared.SAsiento;
import org.uqbar.comunicacion.sharedMemory.shared.SFuncion;

@SuppressWarnings("all")
public class AcomodadorTest {
  @Test
  public void testReservarUnAsiento() {
    SFuncion _instance = SFuncion.getInstance();
    SAsiento _ultimoAsientoReservado = _instance.getUltimoAsientoReservado();
    Assert.assertNull(_ultimoAsientoReservado);
    SAcomodador.reservar();
    SFuncion _instance_1 = SFuncion.getInstance();
    SAsiento _ultimoAsientoReservado_1 = _instance_1.getUltimoAsientoReservado();
    Assert.assertNotNull(_ultimoAsientoReservado_1);
  }
  
  @Test
  public void testCancelarAsientoReservado() {
    SAcomodador.reservar();
    SFuncion _instance = SFuncion.getInstance();
    SFuncion _instance_1 = SFuncion.getInstance();
    SAsiento _ultimoAsientoReservado = _instance_1.getUltimoAsientoReservado();
    _instance.setAsientoACancelar(_ultimoAsientoReservado);
    SAcomodador.cancelar();
    SFuncion _instance_2 = SFuncion.getInstance();
    SAsiento _ultimoAsientoReservado_1 = _instance_2.getUltimoAsientoReservado();
    boolean _isEstaOcupado = _ultimoAsientoReservado_1.isEstaOcupado();
    Assert.assertFalse(_isEstaOcupado);
  }
}
