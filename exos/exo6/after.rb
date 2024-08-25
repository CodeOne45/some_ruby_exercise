class Term
    CRITERIA = [:assiduity, :test, :behavior]

    attr_accessor *CRITERIA

    def initialize(grade = 0)
      CRITERIA.each { |criterion| instance_variable_set("@#{criterion}", grade) }
    end

    def grade
      instance_variables.sum { |var| instance_variable_get(var) } / CRITERIA.size.to_i
    end
end

class Student
    TERMS = [:first, :second, :third]
    attr_reader :terms

    def initialize
        @terms = TERMS.map { |term| [term, Term.new] }.to_h
    end

    def set_all_grades_to(grade)
        terms.each_value { |term| Term::CRITERIA.each { |criterion| term.send("#{criterion}=", grade) } }
    end

    TERMS.each do |term|
        define_method("#{term}_term_grade") { terms[term].grade }
    end

    # Handle undefined methods dynamically using method_missing.
    # This method captures any calls to methods that follow the pattern `term_term_criterion`
    # (e.g: first_term_assiduity) and attempts to retrieve the corresponding criterion
    # from the correct Term object.
    def method_missing(method_name, *args)
        term, criterion = method_name.to_s.match(/(\w+)_term_(\w+)/).captures
        if TERMS.include?(term.to_sym) && Term::CRITERIA.include?(criterion.to_sym)
          terms[term.to_sym].send(criterion)
        else
          super
        end
    end

    def respond_to_missing?(method_name, include_private = false)
      method_name.to_s.match?(/\A(\w+)_term_(\w+)\z/) || super
    end

end