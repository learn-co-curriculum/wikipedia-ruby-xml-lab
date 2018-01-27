RSpec.describe "Parsing Wikipedia XML" do

  context 'collecting all page ids and titles' do
    it 'wrote all page ids and titles starting with Afghanistan or America to pages.txt' do
      pages = File.read("pages.txt")
      pages_canonical = File.read("spec/fixtures/pages_answer.txt")
      pages_array = pages.split("\n")
      pages_canonical_array = pages_canonical.split("\n")
      expect(pages_array).to match_array(pages_canonical_array)
    end
  end

end