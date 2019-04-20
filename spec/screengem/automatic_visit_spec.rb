module Screengem
  RSpec.describe AutomaticVisit do
    let(:capybara_session) { instance_double(Capybara::Session) }

    let(:screen_element) do
      Class.new(Screengem::ScreenElement) do
        def visit_path
          "some/path"
        end

        def a_public_method
        end

        private

        def a_private_method
        end
      end.new
    end

    before do
      allow(screen_element).to receive(:page).and_return(capybara_session)
    end

    it "decorates a public method by calling visit first" do
      allow(capybara_session).to receive(:current_path).and_return("some/path")

      expect(screen_element).to receive(:visit).and_call_original

      AutomaticVisit.new(screen_element).a_public_method
    end

    it "responds to a public method" do
      expect(screen_element.respond_to?(:a_public_method)).to eq(true)
    end

    it "does not respond to a private method" do
      expect(screen_element.respond_to?(:a_private_method)).to eq(false)
    end

    it "raises method missing for an unknown method" do
      expect { screen_element.no_such_method }.to raise_error(NoMethodError, /no_such_method/)
    end
  end
end
