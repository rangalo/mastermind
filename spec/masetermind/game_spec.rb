require File.join(File.dirname(__FILE__), "/../spec_helper" )

module Mastermind
    describe Game do
        before(:each) do
            @messenger = mock("messenger").as_null_object
            @game = Game.new(@messenger)
        end
        context "starting up" do
            it "should prompt for the first guess" do
                @messenger.should_receive(:puts).with("Enter guess:")
                @game.start(%w[r g y c])
            end
            it "should send a welcome message (passing the code to start)" do
                @messenger.should_receive(:puts).with("Welcome to Mastermind!")
                @game.start(%w[r g y c])
            end
        end
        context "making a guess" do
            it "should have a guess method" do
                @game.start(%w[r y c g])
                @game.guess(%w[r y c g])
            end
            context "with all 4 colors correct all in the correct place" do
                it "should mark the guess with bbbb" do
                    @game.start(%w[r g y c])
                    @messenger.should_receive(:puts).with("bbbb")
                    @game.guess(%w[r g y c])
                end
            end
            context "with all 4 colors correct 2 in the correct place" do
                it "should mark the guess with bbbb" do
                    @game.start(%w[r g y c])
                    @messenger.should_receive(:puts).with("bbww")
                    @game.guess(%w[r g c y])
                end
            end
            context "with all 4 colors correct 1 in the correct place" do
                it "should mark the guess with bbbb" do
                    @game.start(%w[r g y c])
                    @messenger.should_receive(:puts).with("wwwb")
                    @game.guess(%w[y r g c])
                end
            end
 end
      end
end
