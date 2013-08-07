package org.uqbar.comunicacion.sharedMemory.shared;

@SuppressWarnings("all")
public class SAsiento {
  private boolean _estaOcupado;
  
  public boolean isEstaOcupado() {
    return this._estaOcupado;
  }
  
  public void setEstaOcupado(final boolean estaOcupado) {
    this._estaOcupado = estaOcupado;
  }
  
  public static SAsiento libre() {
    SAsiento _xblockexpression = null;
    {
      SAsiento _sAsiento = new SAsiento();
      final SAsiento asiento = _sAsiento;
      asiento.setEstaOcupado(false);
      _xblockexpression = (asiento);
    }
    return _xblockexpression;
  }
}
