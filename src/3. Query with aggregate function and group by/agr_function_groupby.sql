USE domova_kniga;
SELECT apartment_id, SUM(amount) AS payments_2026 FROM fees WHERE is_paid=1 AND fee_year = 2026 GROUP BY apartment_id;