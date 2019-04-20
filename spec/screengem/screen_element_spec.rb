module Screengem
  RSpec.describe ScreenElement do
    let(:page) { instance_double(Capybara::Session) }

    context "when subclass does not define visit_path" do
      let(:screen_element) do
        Class.new(ScreenElement).new
      end

      before do
        allow(screen_element).to receive(:page).and_return(page)
      end

      it "visit the specified path" do
        allow(page).to receive(:current_path).and_return("other/path")

        expect(page).to receive(:visit).with("explicit/path")

        screen_element.visit("explicit/path")
      end

      it "skip visit when currently navigated to specified path" do
        allow(page).to receive(:current_path).and_return("explicit/path")

        expect(page).to_not receive(:visit)

        screen_element.visit("explicit/path")
      end
    end

    context "when subclass defines visit_path" do
      let(:screen_element) do
        Class.new(ScreenElement) do
          def visit_path
            "some/path"
          end
        end.new
      end

      before do
        allow(screen_element).to receive(:page).and_return(page)
      end

      it "visit using the defined visit_path" do
        allow(page).to receive(:current_path).and_return("other/path")

        expect(page).to receive(:visit).with("some/path")

        screen_element.visit
      end

      it "skip visit when currently navigated to visit_path" do
        allow(page).to receive(:current_path).and_return("some/path")

        expect(page).to_not receive(:visit)

        screen_element.visit
      end
    end
  end
end
