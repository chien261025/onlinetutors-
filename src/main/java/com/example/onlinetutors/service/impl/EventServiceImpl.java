package com.example.onlinetutors.service.impl;

import com.example.onlinetutors.model.Course;
import com.example.onlinetutors.model.Event;
import com.example.onlinetutors.model.UserEvent;
import com.example.onlinetutors.repository.EventRepository;
import com.example.onlinetutors.repository.UserEventRepository;
import com.example.onlinetutors.service.EventService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class EventServiceImpl implements EventService {

    private final EventRepository eventRepository;
    private final UserEventRepository userEventRepository;

    @Override
    public List<Event> getAllEvents() {
        return this.eventRepository.findAll();
    }

    @Override
    public Event handleCreateEvent(Event event) {
        return this.eventRepository.save(event);
    }

    @Override
    public void handleCreateUserEvent(com.example.onlinetutors.model.User user, Event event) {
        UserEvent userEvent = new UserEvent();
        userEvent.setUser(user);
        userEvent.setEvent(event);
        this.userEventRepository.save(userEvent);

    }

    @Override
    public List<Event> getEventsByUserId(Long userId) {
        return this.userEventRepository.findEventsByUserEventRegistration(userId);
    }

    @Override
    public List<Event> handleGetEventsByCourseId(Long courseId) {
        return this.eventRepository.findByCourse_Id(courseId);
    }

    @Override
    public Event getEventByCourseId(Course course) {
       return this.eventRepository.findEventByCourse(course);
    }
}
