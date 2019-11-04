class AttendanceMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def participation_email(administrator,user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 
    @administrator = administrator

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @administrator.email, subject: 'Nouveau participent') 
  end
  
end
