class UserPdf < Prawn::Document
    def initialize(user)
        super(top_margin: 70)
        @user = user
        user_id
        course
        #line_credits_rows
        
    end

    def company
        text "HEALTHEDUCAT LTD" size: 30, style: :bold
    end

    def user_id
        text "#{@user.names} has completed #{@user.courses.size} courses", size: 30, style: :bold
    end

    def course
        text "this is to certify that the person specified above has successully completed courses in HealthEdu organization"
    end
    
    def line_credits_rows
      
    end 

end