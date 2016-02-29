/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectomio.modelo;

/**
 *
 * @author root
 */

/*


<option value = "0"> Lun - Vie (Mañana) [05:00 am - 11:59 am])</option>
                        <option value = "1"> Lun - Vie (Tarde)  [12:00 pm - 05:59 pm]</option>
                        <option value = "2"> Lun - Vie (Noche)  [06:00 pm - 10:59 pm]</option>
                        <option value = "3"> Sab - Dom (Mañana) [05:00 am - 11:59 am]</option>
                        <option value = "4"> Sab - Dom (Tarde)  [12:00 pm - 05:59 pm]</option>
                        <option value = "5"> Sab - Dom (Noche)  [06:00 pm - 10:59 pm]</option>
*/
public enum Turno {
     SemanaTarde("Lun - Vie (Tarde)  [12:00 pm - 05:59 pm]",1),
     SemanaManiana("Lun - Vie (Mañana) [05:00 am - 11:59 am]",0),
     SemanaNoche("Lun - Vie (Noche)  [06:00 pm - 10:59 pm]",2),
     FinSemanaManiana("Sab - Dom (Mañana) [05:00 am - 11:59 am]",3),
     FinSemanaTarde("Sab - Dom (Tarde)  [12:00 pm - 05:59 pm]",4),
     FinSemanaNoche("Sab - Dom (Noche)  [06:00 pm - 10:59 pm]",5),;
   
       private final String turno; //Color de la madera
        private final int numero; //Peso específico de la madera


Turno(String turno, int numero)
{
this.turno = turno;
this.numero = numero;
}

public String get_string_desde_int(int numero)
{
    String turno = "";
    if(numero == SemanaManiana.numero)
        return SemanaManiana.turno;
    if(numero == SemanaTarde.numero)
        return SemanaTarde.turno;
     if(numero == SemanaNoche.numero)
        return SemanaNoche.turno;
     if(numero == FinSemanaManiana.numero)
        return FinSemanaManiana.turno;
     if(numero == FinSemanaTarde.numero)
        return FinSemanaTarde.turno;
     if(numero == FinSemanaNoche.numero)
        return FinSemanaNoche.turno;
     else
         return turno;
}

public int get_int_desde_string(String turno)
{
    int res =-1;
   if(turno.equals(SemanaTarde.turno)) 
   {
       res =  SemanaTarde.numero;
   }
   if(turno.equals(SemanaManiana.turno)) 
   {
       res =  SemanaManiana.numero;
   }
      if(turno.equals(SemanaNoche.turno)) 
   {
       res =  SemanaNoche.numero;
   }
         if(turno.equals(FinSemanaManiana.turno)) 
   {
      res =  FinSemanaManiana.numero;
   }
          if(turno.equals(FinSemanaTarde.turno)) 
   {
       res =  FinSemanaTarde.numero;
   }
                if(turno.equals(FinSemanaNoche.turno)) 
   {
       res =  FinSemanaNoche.numero;
   }
            
        
    return res;
}
    public int getNumero() {
        return numero;
    }
    
     public String getTurno() {
        return turno;
    }
}
