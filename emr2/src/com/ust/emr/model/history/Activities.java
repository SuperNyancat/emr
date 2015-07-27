package com.ust.emr.model.history;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ih_activities")
public class Activities {
	private Long id;
	private String stairs;
	private String stairsCount;
	private int houseHoldCount;
	private String relationshipAge;
	private String houseWork;
	private String shopping;
	private String yardWork;
	private String situation;

	private String hands;
	private String walking;
	private String climbingStairs;
	private String descendingStairs;
	private String sitting;
	private String gettingUp;
	private String touchingFeet;
	private String reachingBack;
	private String reachingHead;
	private String dressing;
	private String sleep;
	private String stayingAsleep;
	private String restfulSleep;
	private String bathing;
	private String eating;
	private String working;
	private String gettingAlong;
	private String sexual;
	private String liesureActivities;
	private String morningStiffness;
	private String walkHelper;
	private String walkHelper_rate;
	private String hardestThing;
	private String receiveDisability;
	private String applyDisability;
	private String medicalLawsuit;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@Column(name = "stairs")
	public String getStairs() {
		return stairs;
	}

	@Column(name = "stairsCount")
	public String getStairsCount() {
		return stairsCount;
	}

	@Column(name = "houseHoldCount")
	public int getHouseHoldCount() {
		return houseHoldCount;
	}

	
	@Column(name = "houseWork")
	public String getHouseWork() {
		return houseWork;
	}

	@Column(name = "shopping")
	public String getShopping() {
		return shopping;
	}

	@Column(name = "yardWork")
	public String getYardWork() {
		return yardWork;
	}

	@Column(name = "situation")
	public String getSituation() {
		return situation;
	}

	@Column(name = "hands")
	public String getHands() {
		return hands;
	}

	@Column(name = "walking")
	public String getWalking() {
		return walking;
	}

	@Column(name = "climbingStairs")
	public String getClimbingStairs() {
		return climbingStairs;
	}

	@Column(name = "descendingStairs")
	public String getDescendingStairs() {
		return descendingStairs;
	}

	@Column(name = "sitting")
	public String getSitting() {
		return sitting;
	}

	@Column(name = "gettingUp")
	public String getGettingUp() {
		return gettingUp;
	}

	@Column(name = "touchingFeet")
	public String getTouchingFeet() {
		return touchingFeet;
	}

	@Column(name = "reachingBack")
	public String getReachingBack() {
		return reachingBack;
	}

	@Column(name = "reachingHead")
	public String getReachingHead() {
		return reachingHead;
	}

	@Column(name = "dressing")
	public String getDressing() {
		return dressing;
	}

	@Column(name = "sleep")
	public String getSleep() {
		return sleep;
	}

	@Column(name = "stayingAsleep")
	public String getStayingAsleep() {
		return stayingAsleep;
	}

	@Column(name = "restfulSleep")
	public String getRestfulSleep() {
		return restfulSleep;
	}

	@Column(name = "bathing")
	public String getBathing() {
		return bathing;
	}

	@Column(name = "eating")
	public String getEating() {
		return eating;
	}

	@Column(name = "working")
	public String getWorking() {
		return working;
	}

	@Column(name = "gettingAlong")
	public String getGettingAlong() {
		return gettingAlong;
	}

	@Column(name = "sexual")
	public String getSexual() {
		return sexual;
	}

	@Column(name = "liesureActivities")
	public String getLiesureActivities() {
		return liesureActivities;
	}

	@Column(name = "morningStiffness")
	public String getMorningStiffness() {
		return morningStiffness;
	}

	@Column(name = "walkHelper")
	public String getWalkHelper() {
		return walkHelper;
	}

	@Column(name = "walkHelper_rate")
	public String getWalkHelper_rate() {
		return walkHelper_rate;
	}

	@Column(name = "hardestThing")
	public String getHardestThing() {
		return hardestThing;
	}

	@Column(name = "receiveDisability")
	public String getReceiveDisability() {
		return receiveDisability;
	}

	@Column(name = "applyDisability")
	public String getApplyDisability() {
		return applyDisability;
	}

	@Column(name = "medicalLawsuit")
	public String getMedicalLawsuit() {
		return medicalLawsuit;
	}
	
	
	@Column(name="rel_age")
	public String getRelationshipAge() {
		return relationshipAge;
	}

	public void setRelationshipAge(String relationshipAge) {
		this.relationshipAge = relationshipAge;
	}

	/**
	 * setters
	 * */

	public void setId(Long id) {
		this.id = id;
	}

	public void setStairs(String stairs) {
		this.stairs = stairs;
	}

	public void setStairsCount(String stairsCount) {
		this.stairsCount = stairsCount;
	}

	public void setHouseHoldCount(int houseHoldCount) {
		this.houseHoldCount = houseHoldCount;
	}


	public void setHouseWork(String houseWork) {
		this.houseWork = houseWork;
	}

	public void setShopping(String shopping) {
		this.shopping = shopping;
	}

	public void setYardWork(String yardWork) {
		this.yardWork = yardWork;
	}

	public void setSituation(String situation) {
		this.situation = situation;
	}

	public void setHands(String hands) {
		this.hands = hands;
	}

	public void setWalking(String walking) {
		this.walking = walking;
	}

	public void setClimbingStairs(String climbingStairs) {
		this.climbingStairs = climbingStairs;
	}

	public void setDescendingStairs(String descendingStairs) {
		this.descendingStairs = descendingStairs;
	}

	public void setSitting(String sitting) {
		this.sitting = sitting;
	}

	public void setGettingUp(String gettingUp) {
		this.gettingUp = gettingUp;
	}

	public void setTouchingFeet(String touchingFeet) {
		this.touchingFeet = touchingFeet;
	}

	public void setReachingBack(String reachingBack) {
		this.reachingBack = reachingBack;
	}

	public void setReachingHead(String reachingHead) {
		this.reachingHead = reachingHead;
	}

	public void setDressing(String dressing) {
		this.dressing = dressing;
	}

	public void setSleep(String sleep) {
		this.sleep = sleep;
	}

	public void setStayingAsleep(String stayingAsleep) {
		this.stayingAsleep = stayingAsleep;
	}

	public void setRestfulSleep(String restfulSleep) {
		this.restfulSleep = restfulSleep;
	}

	public void setBathing(String bathing) {
		this.bathing = bathing;
	}

	public void setEating(String eating) {
		this.eating = eating;
	}

	public void setWorking(String working) {
		this.working = working;
	}

	public void setGettingAlong(String gettingAlong) {
		this.gettingAlong = gettingAlong;
	}

	public void setSexual(String sexual) {
		this.sexual = sexual;
	}

	public void setLiesureActivities(String liesureActivities) {
		this.liesureActivities = liesureActivities;
	}

	public void setMorningStiffness(String morningStiffness) {
		this.morningStiffness = morningStiffness;
	}

	public void setWalkHelper(String walkHelper) {
		this.walkHelper = walkHelper;
	}

	public void setWalkHelper_rate(String walkHelper_rate) {
		this.walkHelper_rate = walkHelper_rate;
	}

	public void setHardestThing(String hardestThing) {
		this.hardestThing = hardestThing;
	}

	public void setReceiveDisability(String receiveDisability) {
		this.receiveDisability = receiveDisability;
	}

	public void setApplyDisability(String applyDisability) {
		this.applyDisability = applyDisability;
	}

	public void setMedicalLawsuit(String medicalLawsuit) {
		this.medicalLawsuit = medicalLawsuit;
	}

}
