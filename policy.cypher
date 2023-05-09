MATCH (anchor:TrustAnchor)-[issuer:ISSUER]-(certificate:VerifiableCredential)-[policy:`https://vocabulary.uncefact.org/sustainability/sustainable_harvesting`]-(supplier:Entity)
RETURN policy, certificate, supplier, anchor, issuer
UNION
MATCH (anchor:TrustAnchor)-[issuer:ISSUER]-(certificate:VerifiableCredential)-[policy:`https://vocabulary.uncefact.org/sustainability/regeneration_of_tree_cover_after_logging_e_g_to_pre_harvesting_situation`]-(supplier:Entity)
RETURN policy, certificate, supplier, anchor, issuer