require 'spec_helper'

describe DogeIpsum do
  
  describe "#wow_generate" do
    let(:wow_paragraph) { DogeIpsum::Wow.generate }
    let(:opts)          {{ :paragraphs => 2, :lines => 2 }}
    let(:paragraphs)    { DogeIpsum::Wow.generate(opts) }

    describe "no option" do
      it "such generate, wow one paragraph" do
        binding.pry
        wow_paragraph.to_s.scan(/[!]/).count.should == 4
      end
    end

    describe "many options" do
      it "such generate, wow two paragraphs and two lines" do
        paragraphs.to_s.scan(/[!]/).count.should == 10
      end
    end
  end

  describe "#such choices" do
    context "such good method" do
      let(:choices) { DogeIpsum::Wow.many_lines(2) }

      it "generate lines" do
        choices.to_s.scan(/[!]/).count.should == 2
      end
    end

    context "such bad method" do      
      it "such generate errors" do
        expect { DogeIpsum::Wow.such_many_fake_doges_out_there(2) }.to raise_error(NoMethodError)
      end
    end
  end
end