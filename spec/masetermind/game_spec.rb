require File.join(File.dirname(__FILE__), "/../spec_helper" )

module Mastermind
    describe Game do
        before(:each) do
            @messenger = mock("messenger").as_null_object
            @game = Game.new(@messenger)
        end
        context "starting up" do
            it "should send a welcome message" do
                @messenger.should_receive(:puts).with("Welcome to Mastermind!")
                @game.start
            end

            it "should prompt for the first guess" do
                @messenger.should_receive(:puts).with("Enter guess:")
                @game.start(%w[r g y c])
            end
            it "should send a welcome message (passing the code to start)" do
                @messenger.should_receive(:puts).with("Welcome to Mastermind!")
                @game.start(%w[r g y c])
            end

        end
    end
end
