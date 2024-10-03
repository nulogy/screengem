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
        allow(page).to receive(:current_url).and_return("http://localhost/other/path")

        expect(page).to receive(:visit).with("/explicit/path")

        screen_element.visit("/explicit/path")
      end

      it "skip visit when currently navigated to specified path" do
        allow(page).to receive(:current_url).and_return("http://localhost/explicit/path")

        expect(page).to_not receive(:visit)

        screen_element.visit("/explicit/path")
      end
    end

    context "when subclass defines visit_path" do
      context "when visit_path is simple" do
        let(:screen_element) do
          Class.new(ScreenElement) do
            def visit_path
              "/some/path"
            end
          end.new
        end

        before do
          allow(screen_element).to receive(:page).and_return(page)
        end

        it "visit using the defined visit_path" do
          allow(page).to receive(:current_url).and_return("http://localhost/other/path")

          expect(page).to receive(:visit).with(screen_element.visit_path)

          screen_element.visit
        end

        it "skip visit when currently navigated to visit_path" do
          allow(page).to receive(:current_url).and_return("http://localhost/some/path")

          expect(page).to_not receive(:visit)

          screen_element.visit
        end

        it "skip visit when currently navigated to visit_path with an empty query" do
          allow(page).to receive(:current_url).and_return("http://localhost/some/path?")

          expect(page).to_not receive(:visit)

          screen_element.visit
        end

        it "skip visit when currently navigated to visit_path with an empty fragment" do
          allow(page).to receive(:current_url).and_return("http://localhost/some/path#")

          expect(page).to_not receive(:visit)

          screen_element.visit
        end
      end

      context "when visit_path has a query string always visit" do
        let(:screen_element) do
          Class.new(ScreenElement) do
            def visit_path
              "/some/path?foo=bar"
            end
          end.new
        end

        before do
          allow(screen_element).to receive(:page).and_return(page)
        end

        it "visit using the defined visit_path" do
          allow(page).to receive(:current_url).and_return("http://localhost/some/path?foo=baz")

          expect(page).to receive(:visit).with(screen_element.visit_path)

          screen_element.visit
        end

        it "visit when currently navigated to visit_path" do
          allow(page).to receive(:current_url).and_return("http://localhost/some/path?foo=bar")

          expect(page).to receive(:visit)

          screen_element.visit
        end
      end

      context "when visit_path has a fragment" do
        let(:screen_element) do
          Class.new(ScreenElement) do
            def visit_path
              "/some/path#foo/123/bar"
            end
          end.new
        end

        before do
          allow(screen_element).to receive(:page).and_return(page)
        end

        it "visit using the defined visit_path" do
          allow(page).to receive(:current_url).and_return("http://localhost/some/path#foo/456/bar")

          expect(page).to receive(:visit).with(screen_element.visit_path)

          screen_element.visit
        end

        it "skip visit when currently navigated to visit_path" do
          allow(page).to receive(:current_url).and_return("http://localhost/some/path#foo/123/bar")

          expect(page).to_not receive(:visit)

          screen_element.visit
        end
      end
    end
  end
end
