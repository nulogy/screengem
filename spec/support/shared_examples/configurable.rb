RSpec.shared_examples "configurable" do
  it "implements Screengem::Configurable" do
    actor = Class.new { include Screengem::Actor }.new
    screen = instance_double(Screengem::ScreenElements)

    subject = described_class.new.configure(actor, screen)

    expect(subject).to have_attributes(actor: actor, screen: screen)
  end
end
