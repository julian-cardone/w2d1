# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        return nil if self.empty?
        return self.max - self.min if self.any?{|ele| ele == ele.to_i}
    end

    def average
        return nil if self.empty?
        return self.sum / self.length.to_f if self.any?{|ele| ele == ele.to_i}
    end

    def median
        return nil if self.empty?
        self.sort! {|a,b| a <=> b}
        return self[self.length/2] if self.length.odd?
        return self[(self.length/2 - 1..self.length/2)].sum/2.0
    end

    def counts
        hash = Hash.new(0)
        self.each {|ele| hash[ele] += 1}
        hash
    end

    def my_count(value)
        self.select{|ele| ele == value}.length
    end

    def my_index(value)
        self.each_with_index {|ele, i| return i if ele == value}
        nil
    end

    def my_uniq
        hash = Hash.new(0)
        self.each {|ele| hash[ele] += 1}    #could also just do empty hash and hash[ele] = true
        return hash.keys
    end

    def my_transpose
        new_arr = Array.new(self.length) {Array.new(self.length)}
        self.each_with_index do |arr, i|
            arr.each_with_index do |ele, j|
                new_arr[i][j] = self[j][i]
            end
        end
        new_arr                            
    end
#[1,2,3] [0,0].[0,1].[0,2] --> [0,0],[1,0],[2,0] the indexes switch!
#[4,5,6]
#[7,8,9]
end
