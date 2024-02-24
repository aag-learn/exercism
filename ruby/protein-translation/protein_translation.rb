module Translation
  MAP = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP'
  }.freeze

  def self.of_rna(strand)
    [] if strand.size < 3

    strand.chars.each_slice(3).with_object([]) do |codon, r|
      protein = MAP.fetch(codon.join) { |key| raise InvalidCodonError, "Unknown codon: #{key}" }
      return r if protein == 'STOP'

      r.push(protein)
    end
  end
end

class InvalidCodonError < StandardError
end
