package libClases;

import java.util.Scanner;

public class Empresa implements Cloneable, Proceso{
	private Cliente[] clientes;
	private int nClientes;
	private final int INCREMENTO = 5;
	
	public Empresa() {
		this.clientes = new Cliente [INCREMENTO];
		nClientes=0;
	}
	
	public int getN() {
		return nClientes;
	}
	public int nClienteMovil() {
		int nClienteMovil=0;
		
		for(int i=0;i<nClientes;i++) {
			if(clientes[i] instanceof ClienteMovil)
				nClienteMovil++;
		}
		
		return nClienteMovil;
	}
	
	public final int buscarCliente(String dni){
	    int i=0;
	    boolean existe=false;
	    while(i<nClientes && !existe){
	        if(clientes[i].getNIF().equals(dni))
	            existe=true;
	        else
	            i++;
	    }//i=posicion cliente con ese dni

	    if(!existe)
	        i=-1;

	    return i;
	}
	
	
	public void alta(Cliente c) {
		if(c==null || buscarCliente(c.getNIF())!=-1)
			return; //finaliza entonces esto
		clientes[nClientes++]=c;
		if(nClientes == clientes.length) {
			Cliente[] tmp = new Cliente[clientes.length+INCREMENTO]; //si está lleno, aumentamos tam
			for(int i = 0; i < clientes.length; i++)
                tmp[i] = clientes[i]; //copiamos 
			clientes = tmp;
		}
	}
	
	public void alta() {
		//primero si el cliente existe
		Scanner s = new Scanner(System.in);
	    String dni;
	    System.out.println("DNI: ");
	    dni = s.nextLine();

	    int pos=this.buscarCliente(dni); //i=pos del cliente

	    
	    if(pos!=-1) { //dar de alta al cliente
	    	System.out.println("Ya existe un cliente con ese DNI");
	    	System.out.println(clientes[pos]);
	    }
	    else { //pedir datos del nuevo cliente
	        Cliente c = null;
	        String nombre;
	        Fecha fNac, fAlta;
	        float minutosHablados;
	        System.out.println("Nombre: ");
	        nombre = s.nextLine();
			System.out.println("Fecha de Nacimiento: ");
			fNac = Fecha.pedirFecha();
			System.out.println("Fecha de Alta: ");
			fAlta = Fecha.pedirFecha();
	        System.out.println("Minutos que habla al mes: ");
	        minutosHablados = s.nextFloat();
	        System.out.println("Indique tipo de cliente (1-Movil, 2-Tarifa Plana): ");
	        int tipo;
	        tipo=s.nextInt();
	        
	        
	        if(tipo==1) {
	        	System.out.println("Precio por minuto: ");
	        	float precio;
		        precio=s.nextFloat();
	        	System.out.println("Fecha fin permanencia: ");
		        Fecha FPer = Fecha.pedirFecha();
	        	c = new ClienteMovil(dni, nombre, fNac, fAlta, FPer, minutosHablados, precio);
	        }
	        else if (tipo==2) {
	        	String nacionalidad;
                System.out.print("Nacionalidad: ");
                nacionalidad = s.nextLine();

                c = new ClienteTarifaPlana(dni, nombre, fNac, fAlta, minutosHablados, nacionalidad);
	        }
	        
	        alta(c);
	        
	    }
	
	}
	
	
	@Override
	public void ver() {
		System.out.println(this);
	}
	
	@Override
	public Object clone() {
		Empresa obj=null;
		try{
            obj= (Empresa)super.clone();
            obj.clientes = clientes.clone();
            for(int i = 0; i < nClientes; i++)
                obj.clientes[i] = (Cliente)clientes[i].clone();
        }catch(CloneNotSupportedException ex){
        	System.out.println("No se ha podido clonar");
        }
		return (Object)obj;
	}
	
	@Override
	public String toString() {
		String texto = "";
		
		for(int i = 0; i < nClientes; i++)
            texto = texto + clientes[i]+"\n";
        
        return texto;
	}


	public void baja(String dni) {
		Scanner s = new Scanner(System.in);
		
		int pos=buscarCliente(dni);
		if(pos!=-1){
			for(int i = pos; i < nClientes-1; i++)
                clientes[i] = clientes[i+1];
            nClientes--;
            
            if(nClientes < clientes.length - INCREMENTO){
                Cliente[] tmp = new Cliente[clientes.length-INCREMENTO];
                for(int i = 0; i < tmp.length; i++)
                    tmp[i] = clientes[i];
                clientes = tmp;
            }
		}
		
	}


	public void baja() {
		Scanner s = new Scanner(System.in);
		
		System.out.print("Introduzca nif cliente a dar de baja: ");
		String dni = s.nextLine();
        int pos = buscarCliente(dni);
        if(pos!=-1) {
			System.out.println(clientes[pos]);
			System.out.println("¿Seguro que desea eliminarlo (s/n)?");
				
			if(s.nextLine().equals("s")){
				Cliente c = clientes[pos];
				baja(dni);
                System.out.println("El cliente "+c.getNombre()+" con nif "+c.getNIF()+" ha sido eliminado.\n");
                
			}
			else
				System.out.println("El cliente con nif "+clientes[pos].getNIF()+" no se elimina");
				
	       }
        else {
        	System.out.println("No se ha encontrado el cliente.");
        }
		
		
	}
	
	public float factura() {// -> factura global de todos los clientes
		float total=0;
		
		for(int i=0;i<nClientes;i++) {
			total=total+clientes[i].factura();
		}
		
		return total;
	}


	public void descuento(int desc) {
		float descuento = (float) ((100.0 - desc)/100.0); //calculamos coef de descuento
		float precio=0;
		//Aplicamos descuento a todos los clientes de movil
		for(int i=0;i<nClientes;i++) {
			if(clientes[i] instanceof ClienteMovil){ //si el cliente es de tipo movil
				ClienteMovil c = (ClienteMovil) clientes[i];
				precio=c.getPrecioMinuto()*descuento;
				c.setPrecioMinutos(precio);
			}
				
		}
		
	}






}


/*
 *  Nº ilimitado de clientes -> Memoria dinamica
 *  Alta() / Baja() -> tener en cuenta para alta si el cliente ya existe, sino, crearlo
 *  Sobrecargar toString heredado de object  -> @Override
 * 	Factura() -> factura global de todos los clientes
 * 	Descuento(int dcto) -> a los de tarifa movil
 * 	nClienteMovil() -> nCliente con tarifa movil
 * 	Cloneable
 * 	
 * */