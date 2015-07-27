package com.ust.emr.model.history;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ih_social_history")
public class SocialHistory {
	private Long id;
	private String caffeinatedBeverages;
	private int glassesPerDay;
	private String smoke;
	private String smokingDuration;
	private String alcohol;
	private String numberPerWeek;
	private String cutDownDrinking;
	private String drugs;
	private String listOfDrugs;
	private String exercise;
	private String exerciseType;
	private String exerciseWeeklyAmount;
	private String hoursOfSleep;
	private String enoughSleep;
	private String rested;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@Column(name = "caffeinatedBeverages")
	public String getCaffeinatedBeverages() {
		return caffeinatedBeverages;
	}

	@Column(name = "glassesPerDay")
	public int getGlassesPerDay() {
		return glassesPerDay;
	}

	@Column(name = "smoke")
	public String getSmoke() {
		return smoke;
	}

	@Column(name = "smokingDuration")
	public String getSmokingDuration() {
		return smokingDuration;
	}

	@Column(name = "alcohol")
	public String getAlcohol() {
		return alcohol;
	}

	@Column(name = "numberPerWeek")
	public String getNumberPerWeek() {
		return numberPerWeek;
	}

	@Column(name = "cutDownDrinking")
	public String getCutDownDrinking() {
		return cutDownDrinking;
	}

	@Column(name = "drugs")
	public String getDrugs() {
		return drugs;
	}

	@Column(name = "listOfDrugs")
	public String getListOfDrugs() {
		return listOfDrugs;
	}

	@Column(name = "exercise")
	public String getExercise() {
		return exercise;
	}

	@Column(name = "exerciseType")
	public String getExerciseType() {
		return exerciseType;
	}

	@Column(name = "exerciseWeeklyAmount")
	public String getExerciseWeeklyAmount() {
		return exerciseWeeklyAmount;
	}

	@Column(name = "hoursOfSleep")
	public String getHoursOfSleep() {
		return hoursOfSleep;
	}

	@Column(name = "enoughSleep")
	public String getEnoughSleep() {
		return enoughSleep;
	}

	@Column(name = "rested")
	public String getRested() {
		return rested;
	}

	/**
	 * setters
	 * */

	public void setId(Long id) {
		this.id = id;
	}

	public void setCaffeinatedBeverages(String caffeinatedBeverages) {
		this.caffeinatedBeverages = caffeinatedBeverages;
	}

	public void setGlassesPerDay(int glassesPerDay) {
		this.glassesPerDay = glassesPerDay;
	}

	public void setSmoke(String smoke) {
		this.smoke = smoke;
	}

	public void setSmokingDuration(String smokingDuration) {
		this.smokingDuration = smokingDuration;
	}

	public void setAlcohol(String alcohol) {
		this.alcohol = alcohol;
	}

	public void setNumberPerWeek(String numberPerWeek) {
		this.numberPerWeek = numberPerWeek;
	}

	public void setCutDownDrinking(String cutDownDrinking) {
		this.cutDownDrinking = cutDownDrinking;
	}

	public void setDrugs(String drugs) {
		this.drugs = drugs;
	}

	public void setListOfDrugs(String listOfDrugs) {
		this.listOfDrugs = listOfDrugs;
	}

	public void setExercise(String exercise) {
		this.exercise = exercise;
	}

	public void setExerciseType(String exerciseType) {
		this.exerciseType = exerciseType;
	}

	public void setExerciseWeeklyAmount(String exerciseWeeklyAmount) {
		this.exerciseWeeklyAmount = exerciseWeeklyAmount;
	}

	public void setHoursOfSleep(String hoursOfSleep) {
		this.hoursOfSleep = hoursOfSleep;
	}

	public void setEnoughSleep(String enoughSleep) {
		this.enoughSleep = enoughSleep;
	}

	public void setRested(String rested) {
		this.rested = rested;
	}

}
