package org.uqbar.comunicacion.sharedMemory.shared;

import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.comunicacion.sharedMemory.shared.SAsiento;

@SuppressWarnings("all")
public class SFuncion {
  private static SFuncion instance;
  
  private List<SAsiento> _asientos = new Function0<List<SAsiento>>() {
    public List<SAsiento> apply() {
      ArrayList<SAsiento> _arrayList = new ArrayList<SAsiento>();
      return _arrayList;
    }
  }.apply();
  
  public List<SAsiento> getAsientos() {
    return this._asientos;
  }
  
  public void setAsientos(final List<SAsiento> asientos) {
    this._asientos = asientos;
  }
  
  private SAsiento _ultimoAsientoReservado;
  
  public SAsiento getUltimoAsientoReservado() {
    return this._ultimoAsientoReservado;
  }
  
  public void setUltimoAsientoReservado(final SAsiento ultimoAsientoReservado) {
    this._ultimoAsientoReservado = ultimoAsientoReservado;
  }
  
  private SAsiento _asientoACancelar;
  
  public SAsiento getAsientoACancelar() {
    return this._asientoACancelar;
  }
  
  public void setAsientoACancelar(final SAsiento asientoACancelar) {
    this._asientoACancelar = asientoACancelar;
  }
  
  public static SFuncion getInstance() {
    boolean _equals = Objects.equal(SFuncion.instance, null);
    if (_equals) {
      SFuncion _sFuncion = new SFuncion();
      SFuncion.instance = _sFuncion;
    }
    return SFuncion.instance;
  }
  
  public SFuncion() {
    IntegerRange _upTo = new IntegerRange(1, 100);
    final Procedure1<Integer> _function = new Procedure1<Integer>() {
        public void apply(final Integer i) {
          List<SAsiento> _asientos = SFuncion.this.getAsientos();
          SAsiento _libre = SAsiento.libre();
          _asientos.add(_libre);
        }
      };
    IterableExtensions.<Integer>forEach(_upTo, _function);
  }
}
