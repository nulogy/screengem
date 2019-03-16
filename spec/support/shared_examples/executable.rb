RSpec.shared_examples "implements executable" do
  it "implements Screengem::Executable" do
    expect { described_class.new.execute }.to raise_error(
      RuntimeError, /You must define an execute method/
    )
  end
end
