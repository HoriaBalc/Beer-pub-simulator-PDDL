(define (domain berarie-domain)
(:requirements :strips :action-costs)

  (:predicates (berarieDeschisa) 
               (existaClient ?x)
               (ocupat)
               (trimisComanda ?x)
               (trimisComandaOnline ?x)
               (primitPlata ?x)
               (primitPlataOnline ?x)
			   (testN ?x)
			   (testZ ?x)
			   (testA ?x)
			   (testB ?x)
			   (testC ?x)
			   (testS ?x)
			   (testZI ?x)
			   (testCard ?x)
			   (testCash ?x)
			   (ClientulAPrimitBere ?x)
			   (ClientulAPrimitBereOnline ?x)
			   (modulcard ?x)
			   (modulcash ?x)
               (TipBere ?x)
               (TipBereOnline ?x)
               (NeneaIancu ?x)
               (Zaganu ?x)
               (Azuga ?x)
               (Bucur ?x)
               (Calimani ?x)
               (Zimbru ?x)
               (Strasnic ?x)
               (x)
               )

    (:functions (total-cost))
    
  (:action deschidere-Berarie
           :parameters ()
           :precondition (not (berarieDeschisa))
           :effect (berarieDeschisa))
  
  (:action client-Nou
           :parameters (?x)
           :precondition (and (berarieDeschisa) (not(existaClient ?x)) (not(ocupat)))
           :effect (and (existaClient ?x) (ocupat))) 
           
  (:action alege-Mod-Plata-Cash
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (testCash ?x) (existaClient ?x))
           :effect (and (modulcash ?x)
           (increase (total-cost) 1)))    
           
  (:action alege-Mod-Plata-Card
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (testCard ?x) (existaClient ?x))
           :effect (and(modulcard ?x)
           (increase (total-cost) 1)))     
           
  (:action alege-Nenea-Iancu
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (testN ?x) (existaClient ?x))
           :effect (NeneaIancu ?x))  
           
  (:action alege-Zaganu
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (testZ ?x) (existaClient ?x))
           :effect (and (Zaganu ?x) )) 
           
  (:action alege-Azuga
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (testA ?x) (existaClient ?x))
           :effect (Azuga ?x))        
           
 (:action alege-Calimani
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (testC ?x) (existaClient ?x))
           :effect (Calimani ?x)) 
           
 (:action alege-Zimbru
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (testZI ?x) (existaClient ?x))
           :effect (Zimbru ?x))            
           
  (:action alege-Strasnic
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (testS ?x) (existaClient ?x))
           :effect (Strasnic ?x) ) 
           
  (:action livrare-Comanda-Online
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (not (trimisComandaOnline ?x))  
                          (or (NeneaIancu ?x) (Strasnic ?x) (Azuga ?x) (Zimbru ?x) (Calimani ?x) (Zaganu ?x) (Bucur ?x)))
           :effect (and (trimisComandaOnline ?x) 
           (increase (total-cost) 3)))       
           
  (:action livrare-Comanda
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (not (trimisComanda ?x))
                          (or (NeneaIancu ?x) (Strasnic ?x) (Azuga ?x) (Zimbru ?x) (Calimani ?x) (Zaganu ?x) (Bucur ?x)))
           :effect (and  (trimisComanda ?x) 
           (increase (total-cost) 2)))  
           
  (:action plata-Comanda
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (trimisComanda ?x))
           :effect (and  (primitPlata ?x) (not (trimisComanda ?x))))         
      
  (:action plata-Comanda-Online
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (trimisComandaOnline ?x))
           :effect (and  (primitPlataOnline ?x) (not (trimisComandaOnline ?x))))  
      
  (:action finalizare-Plata-Card
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (primitPlata ?x) (modulcard ?x))
           :effect (and (not (primitPlata?x)) (ClientulAPrimitBere ?x))) 
           
  (:action finalizare-Plata-Cash
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (primitPlata ?x) (modulcash ?x))
           :effect (and (not (primitPlata ?x)) (ClientulAPrimitBere?x)))      
           
  (:action finalizare-Plata-Online-Card
           :parameters (?x)
           :precondition (and (berarieDeschisa) (primitPlataOnline ?x) (modulcard ?x))
           :effect (and (not (primitPlataOnline ?x)) (ClientulAPrimitBereOnline?x) ))  
           
  (:action finalizare-Plata-Online-Cash
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (primitPlataOnline ?x) (modulcash ?x))
           :effect (and (not (primitPlataOnline ?x)) (ClientulAPrimitBereOnline?x) ))             
   
  (:action Clientul-A-Primit-Bere-De-Tipul-Nenea-Iancu
           :parameters (?x)
           :precondition (and (berarieDeschisa) (ocupat) (ClientulAPrimitBere ?x) (not (TipBere ?x)) (NeneaIancu ?x))
           :effect (and (TipBere ?x) (not (NeneaIancu ?x)) (not (ocupat))))  
   
  (:action Clientul-A-Primit-Online-Bere-De-Tipul-Nenea-Iancu
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (ClientulAPrimitBereOnline?x) (ocupat) (not (TipBereOnline ?x)) (NeneaIancu ?x))
           :effect (and (TipBereOnline ?x) (not (NeneaIancu ?x))(not (ocupat)))) 

  (:action Clientul-A-Primit-Bere-De-Tipul-Zaganu
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (ClientulAPrimitBere?x) (ocupat) (not (TipBere ?x)) (Zaganu ?x))
           :effect (and (TipBere ?x) (not (Zaganu ?x))(not (ocupat))))  
   
  (:action Clientul-A-Primit-Online-Bere-De-Tipul-Zaganu
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (ClientulAPrimitBereOnline?x) (ocupat) (not (TipBereOnline ?x)) (Zaganu ?x))
           :effect (and (TipBereOnline ?x) (not (Zaganu ?x))(not (ocupat))))            
           
  (:action Clientul-A-Primit-Bere-De-Tipul-Zimbru
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (ClientulAPrimitBere?x) (ocupat) (not (TipBere ?x)) (Zimbru ?x))
           :effect (and (TipBere ?x) (not (Zimbru ?x))(not (ocupat))))  
   
  (:action Clientul-A-Primit-Online-Bere-De-Tipul-Zimbru
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (ClientulAPrimitBereOnline?x) (not (TipBereOnline ?x)) (ocupat) (Zimbru ?x))
           :effect (and (TipBereOnline ?x) (not (Zimbru ?x))(not (ocupat)))) 
           
  (:action Clientul-A-Primit-Bere-De-Tipul-Strasnic
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (ClientulAPrimitBere?x) (not (TipBere ?x)) (ocupat) (Strasnic ?x))
           :effect (and (TipBere ?x) (not (Strasnic ?x))(not (ocupat))))  
   
  (:action Clientul-A-Primit-Online-Bere-De-Tipul-Strasnic
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (ClientulAPrimitBereOnline?x) (not (TipBereOnline ?x)) (ocupat) (Strasnic ?x))
           :effect (and (TipBereOnline ?x) (not (Strasnic ?x))(not (ocupat)))) 
           
  (:action Clientul-A-Primit-Bere-De-Tipul-Azuga
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (ClientulAPrimitBere?x) (ocupat) (not (TipBere ?x)) (Azuga ?x))
           :effect (and (TipBere ?x) (not (Azuga ?x))(not (ocupat))))  
   
  (:action Clientul-A-Primit-Online-Bere-De-Tipul-Azuga
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (ClientulAPrimitBereOnline?x) (not (TipBereOnline ?x)) (ocupat)(Azuga ?x))
           :effect (and (TipBereOnline ?x) (not (Azuga ?x)) (not (ocupat))))        
           
  (:action Clientul-A-Primit-Bere-De-Tipul-Bucur
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (ClientulAPrimitBere?x) (not (TipBere ?x)) (ocupat) (Bucur ?x))
           :effect (and (TipBere ?x) (not (Bucur ?x)) (not (ocupat))))  
   
  (:action Clientul-A-Primit-Online-Bere-De-Tipul-Bucur
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (ClientulAPrimitBereOnline?x) (not (TipBereOnline ?x)) (ocupat) (Bucur ?x))
           :effect (and (TipBereOnline ?x) (not (Bucur ?x)) (not (ocupat))))   
           
  (:action Clientul-A-Primit-Bere-De-Tipul-Calimani
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (ClientulAPrimitBere?x) (not (TipBere ?x)) (Calimani ?x) (ocupat))
           :effect (and (TipBere ?x) (not (Calimani ?x)) (not (ocupat))))  
   
  (:action Clientul-A-Primit-Online-Bere-De-Tipul-Calimani
           :parameters (?x)
           :precondition (and (berarieDeschisa)  (ClientulAPrimitBereOnline?x) (not (TipBereOnline ?x)) (Calimani ?x) (ocupat)) 
           :effect (and (TipBereOnline ?x) (not (Calimani ?x)) (not (ocupat))))  
           
    
       
)