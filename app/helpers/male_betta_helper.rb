module MaleBettaHelper
  def cache_key_for_male_betta
    count          = @male_betta
    max_updated_at = MaleBettum.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "malle_betta/all-#{count}-#{max_updated_at}"
  end
end
