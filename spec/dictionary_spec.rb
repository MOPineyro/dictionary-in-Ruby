require 'rspec'
require 'dictionary'

describe 'Term' do

  before do
   Term.clear
  end

  it 'takes a word and its definition as arguments' do
    test_term = Term.new('carrot', 'A delicious vegetable.', '1')
    test_term.should be_an_instance_of Term
  end

  describe '.create' do
    it 'creates a new instance of the Term class' do
      test_term = Term.create('pen', 'A writing instrument')
      Term.all.length.should eq 1
      test_term.word.should eq 'pen'
    end
  end

  describe '#remove' do
    it 'removes an instance from the @@all_terms array' do
      test_term = Term.create('pen', 'A writing instrument')
      test_term.remove
      Term.all.length.should eq 0
    end
  end

  describe '#edit_term_word' do
    it 'allows the user to edit a terms word' do
      test_term = Term.create('pen', 'A writing instrument')
      test_term.edit_term_word('pencil')
      test_term.word.should eq 'pencil'
    end
  end

  describe '#edit_term_definition' do
    it 'allows the user to edit a terms definition' do
      test_term = Term.create('pen', 'A writing instrument')
      test_term.edit_term_definition('A weapon')
      test_term.definition.should eq 'A weapon'
    end
  end

  describe '.search' do
    it 'searches for a specific object' do
      test_term = Term.create('pen', 'A writing instrument')
      Term.search('pen').should eq [test_term]

    end
  end


end
