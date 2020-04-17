package com.guideme.repos;

import com.guideme.model.Excursion;
import com.guideme.model.Guide;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ExcursionRepo extends CrudRepository<Excursion, String> {
	Excursion findByExcursionId(Long id);

	List<Excursion> findByCityContainingIgnoreCase(String city);

	List<Excursion> findByGuide(Guide guide);

	List<Excursion> findByGuideAndAmountEquals(Guide guide, Integer amount);

	@Modifying
	void deleteByExcursionId(Long excursionId);

	@Query(nativeQuery = true, value = """
			SELECT *
			       FROM excursion 
			       WHERE excursion_id IN (SELECT e.excursion_id
			                              FROM excursion e INNER JOIN booking b 
			                              on excursion.excursion_id = b.excursion_id
			                              GROUP BY e.excursion_id
			                              HAVING count(e.excursion_id) > 3)
			    AND guide_id = :guideId
			""")
	List<Excursion> getMostVisitedExcursions(@Param("guideId") Long guideId);
}
