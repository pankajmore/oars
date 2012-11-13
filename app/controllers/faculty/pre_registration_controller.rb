class Faculty::PreRegistrationController < ApplicationController
 
  def registration_forms
			if !(current_faculty.department.dugc.faculty==current_faculty)
				flash[:error]="#{current_faculty.name}!! you are not authorized for this action"
				redirect_to :action=>'instructor_home'
				end 
			@registration_forms=[]
			current_faculty.department.students.each do |student|
				 student.registration_forms.each do |regform|
				 	if regform.form_type=="pre" and regform.is_submitted==true and regform.is_accepted==false
					 	@registration_forms << regform
				 		end
				 	end
				end
		end		
 	def approve_form
			if !(current_faculty.department.dugc.faculty==current_faculty)
				flash[:error]="#{current_faculty.name}!! you are not authorized for this action"
				redirect_to :action=>'instructor_home'
				end 
			@pregform=RegistrationForm.find(params[:regform_id])
	end
  def accept
    @pregform = RegistrationForm.find(params[:pregform_id])
    @pregform.is_accepted=true
    @pregform.save!
    flash[:success] = "Accepted pre-registration form for #{@pregform.student.name}"
   
    redirect_to :action => "registration_forms",:controller=> "faculty/pre_registration"
  end
  
  def reject
    @pregform = RegistrationForm.find(params[:pregform_id])
    @pregform.is_accepted=false
    @pregform.save!
    flash[:danger] = "Rejected pre-registration form for #{@pregform.student.name}"
   
    redirect_to :action => "registration_forms",:controller=> "faculty"
  end

end
